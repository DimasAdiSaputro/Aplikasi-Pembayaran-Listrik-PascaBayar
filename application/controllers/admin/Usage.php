<?php

/**
 * Class Penggunaan
 *
 * @description Controller untuk halaman dan mengatur fitur penggunaan listrik
 *
 * @package     Admin Controller
 * @subpackage  Penggunaan
 * @category    Controller
 */
class Usage extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    is_user_login();
    $this->load->model('M_usage');
    $this->load->model('M_customer'); // kalau datanya dari Customer_model
  }

  public function index()
  {
    $data["title"] = "Data Penggunaan";
    $data['user_auth'] = get_logged_in_user();
    $data['usages'] = $this->M_usage->get_all_penggunaan();
    $data['customers'] = $this->M_customer->get_all_pelanggan(); // tambahkan ini

    $this->load->view('layouts/head', $data);
    $this->load->view('layouts/sidebar_admin', $data);
    $this->load->view('layouts/header_admin', $data);
    $this->load->view('admin/usage/v_usage', $data);
    $this->load->view('layouts/footer', $data);
    $this->load->view('layouts/end', $data);
  }

  public function create($id_pelanggan)
  {
    $customer = $this->M_customer->get_by_id($id_pelanggan);
    if (!$customer) show_404();

    if ($this->input->method() === 'post') {
      $this->form_validation->set_rules('meter_akhir', 'Meter Akhir', 'required|numeric');
      if ($this->form_validation->run() === TRUE) {
        $data = [
          'id_pelanggan' => $id_pelanggan,
          'bulan' => date('F'),
          'tahun' => date('Y'),
          'meter_awal' => 0,
          'meter_akhir' => $this->input->post('meter_akhir')
        ];
        $this->M_usage->insert_penggunaan($data);
        $this->session->set_flashdata('message_success', 'Berhasil menambahkan penggunaan!');
        return redirect('administrator/penggunaan');
      }
    }

    $data['title'] = 'Input Penggunaan';
    $data['customer'] = $customer;
    $this->session->set_flashdata('form_values', [
      'bulan' => date('F'),
      'tahun' => date('Y'),
      'meter_awal' => 0,
      'meter_akhir' => set_value('meter_akhir', 0)
    ]);
    $this->load->view('admin/usage/v_usage_create', $data);
  }

  public function edit($id_penggunaan)
  {
    // Buat dummy handler sementara
    echo "Ini halaman edit penggunaan dengan ID: " . $id_penggunaan;
    // TODO: Nanti isi logika update penggunaan di sini
  }


  public function delete($id)
  {
    // Cek data penggunaan apakah $id yang direquest sesuai dangan id_pelanggan;
    $check = $this->M_usage->get_penggunaan_by_id($id);

    if ($check) {
      $id_usage = $check->id_penggunaan;
      $id_customer = $check->id_pelanggan;
      $usage_month = $check->bulan;
      $usage_year = $check->tahun;
      // Ambil data tagihan dari tabel tagihan
      $check_bill = $this->M_bill->get_data_tagihan_by_period($id_usage, $id_customer, $usage_month, $usage_year);

      // cek apakah tagihan ada, jika ya hapus penggunaan bersama data tagihannya
      if ($check_bill) {

        // Cek apakah tagihan sudah lunas!
        if ($check_bill->status === "PAID") {
          // Jika ya batalkan dan menampilkan pesan error
          $this->session->set_flashdata('message_error', 'Tidak bisa menghapus data penggunaan yang dimaksud karena tagihannya sudah lunas');
          redirect(base_url('administrator/penggunaan'));
        } else {
          // Jika tidak hapus penggunaan dan tagihannya
          $this->M_usage->delete_penggunaan($id_usage);
          $this->M_bill->delete_tagihan_by_usage_and_period($id_usage, $id_customer, $usage_month, $usage_year);

          $this->session->set_flashdata('message_success', 'Berhasil menghapus data pengunaan!!');
          redirect(base_url('administrator/penggunaan'));
        }
      } else {
        $this->M_usage->delete_penggunaan($id);
        $this->session->set_flashdata('message_success', 'Berhasil menghapus data pengunaan!!');
        redirect(base_url('administrator/penggunaan'));
      }
    } else {
      $this->session->set_flashdata('message_error', 'Gagal menghapus penggunaan karena ID penggunaan yang di dikirim tidak tersedia!');
      redirect(base_url('administrator/penggunaan'));
    }
  }
}
