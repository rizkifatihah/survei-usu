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
          <form class="form-horizontal" method="post" action="<?php echo base_url(changeLink('panel/masterData/createPengguna/doCreate/')); ?>"  enctype="multipart/form-data">
            <div class="col-md-12 bg-red">
              <h3 style="color:white">Profile</h3>
              <hr>
            </div>
            <div class="col-md-12">
              <h4 class="text-center">Preview</h4>
              <center>
                <img src="<?php echo base_url().$logo; ?>" class="img-responsive" alt="preview" id="preview" style="height:150px">
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
                <label class="col-md-2 control-label">Fullname</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" placeholder="Input Fullname" name="nama_lengkap" required />
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
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Birthdate</label>
                <div class="col-md-10">
                  <input type="date" class="form-control" placeholder="Input Birthdate" name="tgl_lahir" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Address</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" placeholder="Input Address" name="alamat" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Access</label>
                <div class="col-md-10">
                  <select class="form-control" id="hak_akses" name="hak_akses" required>
                    <option value="">.:Select Access:.</option>
                    <?php foreach ($hakAkses as $key) : ?>
                      <option value="<?php echo $key->nama_hak_akses; ?>"><?php echo $key->nama_hak_akses; ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="col-md-2 control-label">Username</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" placeholder="Input Username" name="username" required />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Email</label>
                <div class="col-md-10">
                  <input type="email" class="form-control" placeholder="Input email" name="email" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Phone Number</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" onkeypress="onlyNumberKey(event)" placeholder="Input Phone Number" name="no_hp" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 control-label">Password</label>
                <div class="col-md-10">
                  <input type="password" class="form-control" placeholder="Input Password" name="password" required />
                </div>
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
              </div>
            </div>
            <hr />
            <div class="form-group">
              <div class="col-md-12">
                <button type="submit" class="btn btn-sm btn-success  pull-right" style="margin-left:10px">Save</button>
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
<script type="text/javascript">
  $('#data-table').DataTable();
</script>