<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<?php echo base_url()?>assets/styles/main1.css">
        <link rel="stylesheet" href="<?php echo base_url()?>assets/styles/radio1.css">
        <link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url() . $appsProfile->icon; ?>">  
        <script src="<?php echo base_url('assets/'); ?>plugins/jquery/jquery-1.9.1.min.js"></script>
        <link rel="stylesheet" href="<?php echo base_url()?>assets/styles/responsive.css">
        <title><?php echo $appsProfile->apps_name; ?></title>
    </head>
    <body>
        <div class="header-survei">
            <center>
            <img style="margin-left:5rem" class="header-survei-img-left" src="<?php echo base_url().$appsProfile->icon?>" alt="logo" />
            <h1><?php echo $appsProfile->apps_name?></h1>
            <img style="margin-right:3rem" class="header-survei-img-right" src="<?php echo base_url('assets/img/TTU-Logo.png')?>" alt="logo" />
            </center>
        </div>
        <div class="container">
            <div class="centered-survey">
                <h4 class="sub-content-title"><?php echo $survei[0]->kategori; ?></h4>

                <?php if($survei[0]->sub_category) { ?>
                  <h2 class="survey-title"><?php echo $survei[0]->sub_category; ?></h2>
                <?php } ?>
                <form class="form-control" method="post" action="<?php echo base_url('survei/submitSurvei?id='.$id); ?>">
                    
                    <div class="form-input-dropdown">
                        <small><center><b>Selamat Datang di Sistem Survei Kepuasan Pelayanan Universitas Sumatera Utara.<br>Jangan ragu untuk memberikan tanggapan Anda Kepada kami.<br>Tanggapan anda sangat berarti untuk peningkatan pelayanan di Universitas Sumatera Utara.</b><br><br></center></small>
                        <center>
                        <label>Pelayanan apa yang anda terima?</label>
                        </center>
                        <select class="input-dropdown" for="services" name="standar_pelayanan">
                        <?php foreach($services as $row):?>
                          <option value="<?php echo $row->nama_unit_kerja; ?>"><?php echo $row->nama_unit_kerja; ?></option>
                        <?php endforeach;?>
                        </select>
                    </div>
                    <ol class="question-list">
                        <div>
                            <li class="m-1 question-title">Bagaimana kemudahan mendapatkan informasi persyaratan</li>
                            <input type="hidden" name="id_pertanyaan-1"  value="1">
                            <div id="satisfaction-slider">
                                <input type="radio" name="question-1" id="question-1-ans-1" value="1" required>
                                <label for="question-1-ans-1" data-satisfaction="Sangat Tidak Puas"></label>
                                <input type="radio" name="question-1" id="question-1-ans-2" value="2" required>
                                <label for="question-1-ans-2" data-satisfaction="Tidak Puas"></label>
                                <input type="radio" name="question-1" id="question-1-ans-3" value="3" required>
                                <label for="question-1-ans-3" data-satisfaction="Puas"></label>
                                <input type="radio" name="question-1" id="question-1-ans-4" value="4" required>
                                <label for="question-1-ans-4" data-satisfaction="Sangat Puas"></label>
                                <div id="satisfaction-pos-1"></div>
                            </div>
                        </div>
                        <div>
                            <li class="m-1 question-title">Bagaimana kemudahan memenuhi persyaratan persyaratan pelayanan</li>
                            <input type="hidden" name="id_pertanyaan-2"  value="2">
                            <div id="satisfaction-slider">
                                <input type="radio" name="question-2" id="question-2-ans-1" value="1" required>
                                <label for="question-2-ans-1" data-satisfaction="Sangat Tidak Puas"></label>
                                <input type="radio" name="question-2" id="question-2-ans-2" value="2" required>
                                <label for="question-2-ans-2" data-satisfaction="Tidak Puas"></label>
                                <input type="radio" name="question-2" id="question-2-ans-3" value="3" required>
                                <label for="question-2-ans-3" data-satisfaction="Puas"></label>
                                <input type="radio" name="question-2" id="question-2-ans-4" value="4" required>
                                <label for="question-2-ans-4" data-satisfaction="Sangat Puas"></label>
                                <div id="satisfaction-pos-2"></div>
                            </div>
                        </div>
                        <div>
                            <li class="m-1 question-title">Bagaimana kemudahan prosedur pelayanan</li>
                            <input type="hidden" name="id_pertanyaan-3"  value="3">
                            <div id="satisfaction-slider">
                                <input type="radio" name="question-3" id="question-3-ans-1" value="1" required>
                                <label for="question-3-ans-1" data-satisfaction="Sangat Tidak Puas"></label>
                                <input type="radio" name="question-3" id="question-3-ans-2" value="2" required>
                                <label for="question-3-ans-2" data-satisfaction="Tidak Puas"></label>
                                <input type="radio" name="question-3" id="question-3-ans-3" value="3" required>
                                <label for="question-3-ans-3" data-satisfaction="Puas"></label>
                                <input type="radio" name="question-3" id="question-3-ans-4" value="4" required>
                                <label for="question-3-ans-4" data-satisfaction="Sangat Puas"></label>
                                <div id="satisfaction-pos-3"></div>
                            </div>
                        </div>
                        <div>
                            <li class="m-1 question-title">Bagaimana ketepatan waktu dalam penyelesaian pelayanan</li>
                            <input type="hidden" name="id_pertanyaan-4"  value="4">
                            <div id="satisfaction-slider">
                                <input type="radio" name="question-4" id="question-4-ans-1" value="1" required>
                                <label for="question-4-ans-1" data-satisfaction="Sangat Tidak Puas"></label>
                                <input type="radio" name="question-4" id="question-4-ans-2" value="2" required>
                                <label for="question-4-ans-2" data-satisfaction="Tidak Puas"></label>
                                <input type="radio" name="question-4" id="question-4-ans-3" value="3" required>
                                <label for="question-4-ans-3" data-satisfaction="Puas"></label>
                                <input type="radio" name="question-4" id="question-4-ans-4" value="4" required>
                                <label for="question-4-ans-4" data-satisfaction="Sangat Puas"></label>
                                <div id="satisfaction-pos-4"></div>
                            </div>
                        </div>
                        <div>
                            <li class="m-1 question-title">Bagaimana kesesuaian produk pelayanan antara yang tercantum dalam standar pelayanan dengan hasil yang diberikan</li>
                            <input type="hidden" name="id_pertanyaan-5"  value="5">
                            <div id="satisfaction-slider">
                                <input type="radio" name="question-5" id="question-5-ans-1" value="1" required>
                                <label for="question-5-ans-1" data-satisfaction="Sangat Tidak Puas"></label>
                                <input type="radio" name="question-5" id="question-5-ans-2" value="2" required>
                                <label for="question-5-ans-2" data-satisfaction="Tidak Puas"></label>
                                <input type="radio" name="question-5" id="question-5-ans-3" value="3" required>
                                <label for="question-5-ans-3" data-satisfaction="Puas"></label>
                                <input type="radio" name="question-5" id="question-5-ans-4" value="4" required>
                                <label for="question-5-ans-4" data-satisfaction="Sangat Puas"></label>
                                <div id="satisfaction-pos-5"></div>
                            </div>
                        </div>
                        <div>
                            <li class="m-1 question-title">Bagaimana kompetensi dan kemampuan petugas dalam memberikan pelayanan</li>
                            <input type="hidden" name="id_pertanyaan-6"  value="6">
                            <div id="satisfaction-slider">
                                <input type="radio" name="question-6" id="question-6-ans-1" value="1" required>
                                <label for="question-6-ans-1" data-satisfaction="Sangat Tidak Puas"></label>
                                <input type="radio" name="question-6" id="question-6-ans-2" value="2" required>
                                <label for="question-6-ans-2" data-satisfaction="Tidak Puas"></label>
                                <input type="radio" name="question-6" id="question-6-ans-3" value="3" required>
                                <label for="question-6-ans-3" data-satisfaction="Puas"></label>
                                <input type="radio" name="question-6" id="question-6-ans-4" value="4" required>
                                <label for="question-6-ans-4" data-satisfaction="Sangat Puas"></label>
                                <div id="satisfaction-pos-6"></div>
                            </div>
                        </div>
                        <div>
                            <li class="m-1 question-title">Bagaimana perilaku petugas terkait kesopanan dan keramahan dalam memberikan pelayanan</li>
                            <input type="hidden" name="id_pertanyaan-7"  value="7">
                            <div id="satisfaction-slider">
                                <input type="radio" name="question-7" id="question-7-ans-1" value="1" required>
                                <label for="question-7-ans-1" data-satisfaction="Sangat Tidak Puas"></label>
                                <input type="radio" name="question-7" id="question-7-ans-2" value="2" required>
                                <label for="question-7-ans-2" data-satisfaction="Tidak Puas"></label>
                                <input type="radio" name="question-7" id="question-7-ans-3" value="3" required>
                                <label for="question-7-ans-3" data-satisfaction="Puas"></label>
                                <input type="radio" name="question-7" id="question-7-ans-4" value="4" required>
                                <label for="question-7-ans-4" data-satisfaction="Sangat Puas"></label>
                                <div id="satisfaction-pos-7"></div>
                            </div>
                        </div>
                        <div>
                            <li class="m-1 question-title">Bagaimana kualitas sarana dan prasarana pendukung pelayanan</li>
                            <input type="hidden" name="id_pertanyaan-8"  value="8">
                            <div id="satisfaction-slider">
                                <input type="radio" name="question-8" id="question-8-ans-1" value="1" required>
                                <label for="question-8-ans-1" data-satisfaction="Sangat Tidak Puas"></label>
                                <input type="radio" name="question-8" id="question-8-ans-2" value="2" required>
                                <label for="question-8-ans-2" data-satisfaction="Tidak Puas"></label>
                                <input type="radio" name="question-8" id="question-8-ans-3" value="3" required>
                                <label for="question-8-ans-3" data-satisfaction="Puas"></label>
                                <input type="radio" name="question-8" id="question-8-ans-4" value="4" required>
                                <label for="question-8-ans-4" data-satisfaction="Sangat Puas"></label>
                                <div id="satisfaction-pos-8"></div>
                            </div>
                        </div>
                        <div>
                            <li class="m-1 question-title">Apakah anda diminta bayaran</li>
                            <div class="tf-container">
                            <input type="hidden" name="id_pertanyaan-9"  value="9">
                            <div class="tf">
                                <div>
                                    <input type="radio" name="question-9" id="tf" class="Ya" value="YA" /><label>Iya</label>
                                </div>
                                <div>
                                    <input type="radio" name="question-9" id="tf" class="Tidak" value="TIDAK" /><label>Tidak</label>
                                </div>
                                </div>
                                <input type="text" class="input-tf" name="keterangan_tambahan[9]" id="keterangan_tambahan" placeholder="Berapa & diberikan kepada?" style="display:none;" >
                                <script>
                                    $('.Ya').click(function(){
                                        $('#keterangan_tambahan').show();
                                    });
                                    $('.Tidak').click(function(){
                                        $('#keterangan_tambahan').hide();
                                    });
                                </script>
                            </div>
                        </div>
                        <div>
                            <div class="question-control">
                            <li class="m-1 question-title">Apakah tersedia tempat pengaduan</li>
                            <div class="tf-container">
                            <input type="hidden" name="id_pertanyaan-10"  value="10">
                            <div class="tf">
                                <div>
                                    <input type="radio" value="YA" name="question-10" id="tf" /><label>Iya</label>
                                </div>
                                <div>
                                    <input type="radio" value="TIDAK" name="question-10" id="tf" /><label>Tidak</label>
                                </div>
                            </div>
                            </div>
                            </div>
                        </div>
                        <div class="form-button">
                            <button class="btn-submit">Kirim Jawaban</button>
                        </div>
                    </ol>
                </form>
                <div class="footer"><p>Powered By  <a class="linkto" href="">Universitas Sumatera Utara</a></p></div>
            </div>
        </div>
    </body>
</html>