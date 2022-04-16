<style>
    p {
    margin: 0 1 10px;
}
td {
  text-align: left;
}

</style>
<!-- begin #content -->
<div id="content" class="content" style="margin-left: 0px;padding-top:30px">
  <!-- begin breadcrumb -->
  <ol class="breadcrumb pull-right">
  <li><a href="javascript:;">Survei</a></li>
    <li><a href="javascript:;"><?php echo $survei[0]->kategori?></a></li>
    <li class="active"><?php echo $this->session->userdata('standar_pelayanan')?></li>

  </ol>
  <!-- end breadcrumb -->
  <!-- begin page-header -->
  <h1 class="page-header"></h1>
  <br><br>
  <!-- end page-header -->
  <!-- begin row -->
  <div class="row">
    <div class="col-md-12">
    <div class="col-md-2"></div>
    <!-- begin col-12 -->
    <div class="col-md-8">
      <!-- begin panel -->
      <div class="panel panel-inverse">
        <div class="panel-heading">
          <div class="panel-heading-btn">
          </div>
          <h4 class="panel-title"><?php echo $appsProfile->apps_name; ?></h4>
        </div>
        <div class="panel-body">
        <div class="row">
            <h3 align="center" class="text-grey text-light"><b><?php echo $this->session->userdata('standar_pelayanan')?></b></h3>
            <h4 align="center" class="text-grey text-light"><?php echo $survei[0]->kategori; ?></h4>
            <hr>
            <form method="post" action="<?php echo base_url('survei/submitSurvei?id='.$id); ?>">
            <div class="form-group">
                <div class="row">
                <div class="col-xs-12">
                <div class="col-xs-10" style="margin-left:40px;margin-right:30px;">
                <table style="width: 100%;">
                  <tr>
                    <td>
                    <p style="color:black;font-size:18px;">Hal Apa yang anda lakukan pada pelayanan tersebut ?</p>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <input type="text" class="form-control" name="information" required>
                    </td>
                  </tr>
                </table>
                </div>
                </div>
                </div>
            </div>
                <?php $i=1; foreach($pertanyaan as $p):?>
                <div class="row">
                <div class="col-xs-12">
                <div class="col-xs-10" style="margin-left:40px;margin-right:30px;">
                <table>
                  <tr>
                    <td valign="top">
                    <p style="color:black;font-size:18px;"><?php echo $i; ?>. &nbsp;</p>
                    </td>
                    <td valign="top">
                    <p style="color:black;font-size:18px;"><?php echo $p->pertanyaan; ?>
                      <input type="hidden" name="id_pertanyaan[]" value="<?php echo $p->id_pertanyaan; ?>">
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td>
                    <p style="color:black;font-size:18px;">Jawaban : </p>
                    <?php if($p->kategori_jawaban == '1'): ?>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4"> <label style="font-size:18px;margin-right:13px;">SANGAT PUAS</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3"> <label style="font-size:18px;margin-right:13px;">PUAS</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2"> <label style="font-size:18px;margin-right:13px;">TIDAK PUAS</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1"> <label style="font-size:18px;margin-right:13px;">SANGAT TIDAK PUAS</label>
                    <?php elseif($p->kategori_jawaban == '2'): ?>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1"> <label style="font-size:18px;margin-right:13px;">1</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2"> <label style="font-size:18px;margin-right:13px;">2</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3"> <label style="font-size:18px;margin-right:13px;">3</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4"> <label style="font-size:18px;margin-right:13px;">4</label>
                    <?php elseif($p->kategori_jawaban == '3'): ?>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="YA"> <label style="font-size:18px;margin-right:13px;">YA</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="TIDAK"> <label style="font-size:18px;margin-right:13px;">TIDAK</label>
                    <?php endif; ?>
                    </td>
                  </tr>
                </table>
                </div>
                </div>
                </div>
                <?php $i++; endforeach; ?>
                <br />
                <div class="form-group" align="center">
                    <button type="submit" class="btn btn-flat btn-success ">KIRIM JAWABAN</button>
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
    <div class="col-md-2"></div>
    </div>
  </div>
  <!-- end row -->
</div>
<!-- end #content -->
