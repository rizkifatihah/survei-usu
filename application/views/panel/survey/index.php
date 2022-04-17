<!-- begin #content -->
<div id="content" class="content">
  <!-- begin breadcrumb -->
  <ol class="breadcrumb pull-right">
    <li><a href="javascript:;">Home</a></li>
    <li><a href="javascript:;"><?php echo $title; ?></a></li>
    <li class="active"><?php echo $subtitle; ?></li>
  </ol>
  <!-- end breadcrumb -->
  <!-- begin page-header -->
  <h1 class="page-header"><?php echo $title; ?></h1>
  <!-- end page-header -->

  <!-- begin row -->
  <div class="row">
    <!-- begin col-12 -->
    <div class="col-md-12">
      <!-- begin panel -->
      <div class="panel panel-inverse">
        <div class="panel-heading">
          <div class="panel-heading-btn">
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
          </div>
          <h4 class="panel-title"><?php echo $subtitle; ?></h4>
        </div>
        <div class="panel-body">
          <?php echo $this->session->flashdata('notif'); ?>
          <form action="<?php echo base_url('panel/survey/listSurvey'); ?>" class="form-horizontal" method="GET">
            <div class="col-md-12">
              <label for="">Unit</label>
              <select name="unit" class="form-control select2" id="unit">
                <option value="">-- Select Unit --</option>
                <?php foreach ($unitAll as $key) { ?>
                  <option value="<?php echo $key->nama_kategori; ?>" <?php if($this->input->get('unit') == $key->nama_kategori) { echo 'selected'; } ?>><?php echo $key->nama_kategori; ?></option>
                <?php } ?>
              </select>
            </div>
            <div class="col-md-4">
                <label for="">Start Date</label>
              <input type="date" class="form-control" name="dari" value="<?php echo $dari; ?>">
            </div>
            <div class="col-md-4">
                <label for="">End Date</label>
              <input type="date" class="form-control" name="sampai" value="<?php echo $sampai; ?>">
            </div>
            <div class="col-md-2">
              <br>
              <button type="submit" class="btn btn-primary btn-md">Cari</button>
            </div>
          </form>
          <div class="col-md-12">
          <a href="<?php echo base_url(changeLink('panel/survey/createSurvey')); ?>" class="btn btn-xs btn-primary pull-right">Add Survey</a>
          <br />
          <br />
          </div>
          <table class="table table-striped table-bordered dataex-html5-selectors">
            <thead>
              <tr>
                <th>No</th>
                <th>Unit</th>
                <th>Number</th>
                <th>Poin</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <?php $no=1; foreach($listSurvei as $row):?>
                <tr>
                  <td><?php echo $no?>
                  <td><?php echo $row->kategori; ?></td>
                  <td>
                    <?php $getDataUsed = $this->db->query("SELECT COUNT(*) as hitung FROM survei_detail_survei WHERE id_survei = '$row->id_daftar_survei' AND status='Digunakan'")->row();?>
                    <?php echo $getDataUsed->hitung .'/'. $row->jumlah_survei; ?>
                  </td>
                  <td>
                    <?php
                      $getDataUsed = $this->db->query("SELECT COUNT(*) as hitung FROM survei_detail_survei WHERE id_survei = '$row->id_daftar_survei' AND status='Digunakan'")->row();
                      $poin = $this->db->query("SELECT SUM(jawaban) as poin FROM survei_jawaban WHERE id_survei = '$row->id_daftar_survei'")->row();
                      if($poin->poin != 0){
                      echo ($poin->poin/32*100)/$getDataUsed->hitung;
                      }else{
                        echo 0;
                      }
                      
                    ?>
                  </td>
                  <td><?php echo tgl_indo($row->mulai_survei); ?></td>
                  <td><?php echo tgl_indo($row->selesai_survei); ?></td>
                  <td>
                    <a href="<?php echo base_url(changeLink('panel/survey/detailSurvey/'.$row->id_daftar_survei)); ?>" class="btn btn-xs btn-primary">Detail</a>
                    <a href="<?php echo base_url(changeLink('panel/survey/deleteSurvey/'.$row->id_daftar_survei)); ?>" class="btn btn-xs btn-danger" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                  </td>
                </tr>
              <?php $no++; endforeach; ?>
            </tbody>
          </table>
        </div>
      </div>
      <!-- end panel -->
    </div>
    <!-- end col-12 -->
  </div>
  <!-- end row -->
</div>
<!-- end #content -->

<script type="text/javascript">
$(document).ready(function() {
    $('.dataex-html5-selectors').DataTable( {
        dom: 'Bfrtip',
        buttons: [
          {
              extend: 'excelHtml5',
              exportOptions: {
                  columns: ':visible'
              }
          },
          {
              extend: 'csvHtml5',
              exportOptions: {
                  columns: ':visible'
              }
          },
          {
                extend: 'pdfHtml5',
                download:'open',
                exportOptions: {
                    columns: ':visible'
                }
          },
          'colvis',
        ]
    } );
    $('.pagination').addClass('pull-right')
} );
</script>