<main class="content">
  <div class="container-fluid p-0">
    <h3 class="mb-4"><strong><?= $title ?></strong></h3>

    <div class="card">
      <div class="card-body">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>ID Pelanggan</th>
              <th>Nama</th>
              <th>Alamat</th>
              <th>Daya</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($customers as $customer): ?>
              <tr>
                <td><?= $customer->id_pelanggan ?></td>
                <td><?= $customer->nama_pelanggan ?></td>
                <td><?= $customer->alamat ?></td>
                <td><?= $customer->daya ?></td>
                <td>
                  <a href="<?= base_url('administrator/penggunaan/input/' . $customer->id_pelanggan) ?>" class="btn btn-sm btn-primary">
                    Input Penggunaan
                  </a>
                </td>
              </tr>
            <?php endforeach ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</main>
