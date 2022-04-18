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
  </ol>
  <!-- end breadcrumb -->
  <!-- begin page-header -->
  <h1 class="page-header"></h1>
  <br><br>
  <!-- end page-header -->
  <!-- begin row -->
  <div class="row">
    <div class="col-md-12">
    <div class="col-md-3"></div>
    <!-- begin col-12 -->
    <div class="col-md-6">
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
                    <p style="color:black;font-size:16px;">Pelayanan apa yang anda lakukan?</p>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <select class="form-control input-line" name="standar_pelayanan" id="standar_pelayanan" required>
                        <option value="">Pilih Pelayanan</option>
                        <?php foreach($services as $row):?>
                          <option value="<?php echo $row->nama_unit_kerja; ?>"><?php echo $row->nama_unit_kerja; ?></option>
                        <?php endforeach;?>
                      </select>
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
                    <p style="color:black;font-size:16px;"><?php echo $i; ?>. &nbsp;</p>
                    </td>
                    <td valign="top">
                    <p style="color:black;font-size:16px;"><?php echo $p->pertanyaan; ?>
                      <input type="hidden" name="id_pertanyaan[]" value="<?php echo $p->id_pertanyaan; ?>">
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td>
                    <p style="color:black;font-size:16px;">Jawaban : </p>
                    <?php if($p->kategori_jawaban == '1'): ?>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4"> <label style="font-size:16px;margin-right:13px;">Sangat Puas</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3"> <label style="font-size:16px;margin-right:13px;">Puas</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2"> <label style="font-size:16px;margin-right:13px;">Tidak Puas</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1"> <label style="font-size:16px;margin-right:13px;">Sangat Tidak Puas</label>
                    <?php elseif($p->kategori_jawaban == '2'): ?>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="1"> <label style="font-size:16px;margin-right:13px;">1</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="2"> <label style="font-size:16px;margin-right:13px;">2</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="3"> <label style="font-size:16px;margin-right:13px;">3</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="4"> <label style="font-size:16px;margin-right:13px;">4</label>
                    <?php elseif($p->kategori_jawaban == '3'): ?>
                        <?php if($i == '9'){ ?>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" id="jawabanYa" value="YA"> <label style="font-size:16px;margin-right:13px;" >Ya</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" id="jawabanTidak" value="TIDAK"> <label style="font-size:16px;margin-right:13px;">Tidak</label>
                        <br>
                        <input type="text" class="form-control" name="keterangan_tambahan[<?php echo $p->id_pertanyaan; ?>]" id="keterangan_tambahan" placeholder="Berapa & diberikan kepada?" style="display:none;">
                        <br>
                        <script>
                            $('#jawabanYa').click(function(){
                                $('#keterangan_tambahan').show();
                            });
                            $('#jawabanTidak').click(function(){
                                $('#keterangan_tambahan').hide();
                            });
                        </script>
                        <?php }else{ ?>
                          <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="YA"> <label style="font-size:16px;margin-right:13px;">Ya</label>
                        <input type="radio" name="jawaban[<?php echo $p->id_pertanyaan; ?>]" value="TIDAK"> <label style="font-size:16px;margin-right:13px;">Tidak</label>
                        <br>
                        <?php } ?>
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
    <div class="col-md-3"></div>
    </div>
  </div>
  <!-- end row -->
</div>
<!-- end #content -->
