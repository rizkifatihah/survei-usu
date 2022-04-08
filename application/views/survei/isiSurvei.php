<style>
    p {
    margin: 0 1 10px;
}
</style>
<!-- begin #content -->
<div id="content" class="content" style="margin-left: 0px;padding-top:30px">
  <!-- begin breadcrumb -->
  <ol class="breadcrumb pull-right">
  <li><a href="javascript:;">Survei</a></li>
    <li><a href="javascript:;"><?php echo $survei[0]->kategori?></a></li>
    <li class="active"><?php echo $survei[0]->standar_pelayanan?></li>

  </ol>
  <!-- end breadcrumb -->
  <!-- begin page-header -->
  <h1 class="page-header"></h1>
  <!-- end page-header -->

  <!-- begin row -->
  <div class="row">
    <!-- begin col-12 -->
    <div class="col-md-12">
      <!-- begin panel -->
      <div class="panel panel-inverse">
        <div class="panel-heading">
          <div class="panel-heading-btn">
          </div>
          <h4 class="panel-title"><?php echo $appsProfile->apps_name; ?></h4>
        </div>
        <div class="panel-body">
        <div class="row">
            <h3 align="center" class="text-grey text-light"><b><?php echo $survei[0]->standar_pelayanan; ?></b></h3>
            <h4 align="center" class="text-grey text-light"><?php echo $survei[0]->kategori; ?></h4>
            <hr>
            <form method="post" action="<?php echo base_url('survei/submitSurvei?id='.$id); ?>">
            <div class="form-group">
                <?php $i=1; foreach($pertanyaan as $p):?>
                <div class="row">
                <div class="col-xs-12">
                <div class="col-xs-10" style="margin-left:40px;margin-right:30px;">
                    <p align="left"><?php echo $i; ?>. <?php echo $p->pertanyaan; ?></p>
                    <input type="hidden" name="id_pertanyaan[]" value="<?php echo $p->id_pertanyaan; ?>">
                    <div align="left">
                    <?php if($p->kategori_jawaban == '1'): ?>
                        <select class="form-control" name="jawaban[<?php echo $p->id_pertanyaan; ?>]">
                            <option value="">Pilih Jawaban</option>
                            <option value="Sangat Puas">Sangat Puas</option>
                            <option value="Puas">Puas</option>
                            <option value="Tidak Puas">Tidak Puas</option>
                            <option value="Sangat Tidak Puas">Sangat Tidak Puas</option>
                        </select>
                    <?php elseif($p->kategori_jawaban == '2'): ?>
                        <select class="form-control" name="jawaban[<?php echo $p->id_pertanyaan; ?>]">
                            <option value="">Pilih Jawaban</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    <?php elseif($p->kategori_jawaban == '3'): ?>
                        <select class="form-control" name="jawaban[<?php echo $p->id_pertanyaan; ?>]">
                            <option value="">Pilih Jawaban</option>
                            <option value="Ya">Ya</option>
                            <option value="Tidak">Tidak</option>
                        </select>
                    <?php endif; ?>
                    <br>
                    </div>
                </div>
                </div>
                </div>
                <?php $i++; endforeach; ?>
                <br />
                <div class="form-group" align="center">
                    <button type="submit" class="btn btn-flat btn-primary ">KIRIM JAWABAN</button>
                    <hr>
                    <br>
                    <small><?php echo $appsProfile->footer; ?></small>
                </div>
            </div>
            </form>
        </div>
        </div>
      </div>
      <!-- end panel -->
    </div>
    <!-- end col-12 -->
  </div>
  <!-- end row -->
</div>
<!-- end #content -->
