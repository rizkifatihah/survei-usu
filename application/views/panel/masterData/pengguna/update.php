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
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
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
          <form class="form-horizontal" method="post" action="<?php echo base_url(changeLink('panel/masterData/updatePengguna/doUpdate/' . $pengguna[0]->id_pengguna)); ?>" enctype="multipart/form-data">
            <div class="col-md-12 bg-red">
              <h3 style="color:white">Profile</h3>
              <hr>
            </div>
            <div class="col-md-12">
              <h4 class="text-center">Preview</h4>
              <center>
                <?php if (!empty($pengguna[0]->foto_pengguna)) : ?>
                  <img src="<?php echo base_url() . $pengguna[0]->foto_pengguna; ?>" class="img-responsive" alt="preview" id="preview" style="height:150px">
                <?php else : ?>
                  <img src="<?php echo base_url().$logo; ?>" class="img-responsive" alt="preview" id="preview" style="height:150px">
                <?php endif; ?>
              </center>
              <br />
              <div class="form-group">
                <label class="col-md-1 control-label">User Photo</label>
                <div class="col-md-11">
                  <input type="file" name="foto_pengguna" class="form-control" id="foto_pengguna" accept="image/*" />
                </div>
              </div>
            </div>
            <script type="text/javascript">
              function readURL(input) {
                if (input.files && input.files[0]) {
                  var reader = new FileReader();
                  reader.onload = function(e) {
                    $('#preview').attr('src', e.target.result);
                  }
                  reader.readAsDataURL(input.files[0]);
                }
              }
              $("#foto_pengguna").change(function() {
                readURL(this);
              });
            </script>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-2 control-label">Username</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" placeholder="Input Username" value="<?php echo $pengguna[0]->username; ?>" name="username" disabled />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Fullname</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" placeholder="Input Fullname" value="<?php echo $pengguna[0]->nama_lengkap; ?>" name="nama_lengkap" required />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Gender</label>
                <div class="col-md-10">
                  <select name="jenkel" id="jenkel" class="form-control">
                    <option value="">.:Select Gender:.</option>
                    <option value="L">Male</option>
                    <option value="P">Female</option>
                  </select>
                </div>
                <script>
                  $('#jenkel').val('<?php echo $pengguna[0]->jenkel; ?>')
                </script>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Birthdate</label>
                <div class="col-md-10">
                  <input type="date" class="form-control" placeholder="Input Birthdate" name="tgl_lahir" value="<?php echo $pengguna[0]->tgl_lahir; ?>" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Address</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" placeholder="Input Address" value="<?php echo $pengguna[0]->alamat; ?>" name="alamat"/>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Access</label>
                <div class="col-md-10">
                  <select name="hak_akses" id="hak_akses" class="form-control">
                    <option value="">.:Select Access:.</option>
                    <?php foreach ($hakAkses as $key) : ?>
                      <option value="<?php echo $key->nama_hak_akses; ?>"><?php echo $key->nama_hak_akses; ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
                <script>
                  $('#hak_akses').val('<?php echo $pengguna[0]->hak_akses; ?>')
                </script>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-2 control-label">Email</label>
                <div class="col-md-10">
                  <input type="email" class="form-control" placeholder="Input email" value="<?php echo $pengguna[0]->email; ?>" name="email" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Phone Number</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" placeholder="Input Phone Number" onkeypress="onlyNumberKey(event)" value="<?php echo $pengguna[0]->no_hp; ?>" name="no_hp" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Password</label>
                <div class="col-md-10">
                  <input type="password" class="form-control" placeholder="Input New Password" id="password" onkeyup="cekPassword()" name="password" />
                  <!-- <font color="red" id="notifpass"></font> -->
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Repeat Password</label>
                <div class="col-md-10">
                  <input type="password" class="form-control" placeholder="Repeat New Password" onkeyup="cekPassword()" id="re_password" name="re_password" />
                  <font color="red" id="notifrepass"></font>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Account Status</label>
                <div class="col-md-10">
                  <select name="status_pengguna" id="status_pengguna" class="form-control">
                    <option value="">.:Select Account Status:.</option>
                    <option value="0">Not Active</option>
                    <option value="1">Active</option>
                  </select>
                </div>
                <script>
                  $('#status_pengguna').val('<?php echo $pengguna[0]->status_pengguna; ?>')
                </script>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Unit</label>
                <div class="col-md-10">
                  <select class="form-control" id="unit" name="unit" required>
                    <option value="">.:Select Unit:.</option>
                    <?php foreach ($unit as $key) : ?>
                      <option value="<?php echo $key->nama_kategori; ?>"><?php echo $key->nama_kategori; ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
                <script>
                  $('#unit').val('<?php echo $pengguna[0]->unit; ?>')
                </script>
              </div>
              <script type="text/javascript">
                function cekPassword() {
                  var repass = $('#re_password').val()
                  var pass = $('#password').val()
                  if (repass != pass || pass != repass) {
                    $('#notifrepass').prop('color', 'red');
                    $('#notifrepass').text('Ulangi password tidak sama dengan password');
                    $('#btnSimpan').attr('disabled', true);
                  } else {
                    $('#notifrepass').prop('color', 'green');
                    $('#notifrepass').text('Ulangi password sama dengan password');
                    $('#btnSimpan').removeAttr('disabled');
                  }
                }
              </script>
            </div>
            <div class="col-md-12">
              <hr />
              <div class="form-group">
                <div class="col-md-12">
                  <button type="submit" class="btn btn-sm btn-success pull-right" id="btnSimpan" style="margin-left:10px">Save</button>
                  <a href="<?php echo base_url(changeLink('panel/masterData/pengguna/')); ?>" class="btn btn-sm btn-danger pull-right">Cancel</a>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- end col-12 -->
  </div>
  <!-- end row -->
</div>
<!-- end #content -->