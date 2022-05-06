<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url() . $appsProfile->icon; ?>">
        <title><?php echo $appsProfile->apps_name; ?></title>
        <link rel="stylesheet" href="<?php echo base_url()?>/assets/stylesSurvei/main.css">
        <link rel="stylesheet" href="<?php echo base_url()?>/assets/stylesSurvei/responsive.css">
        <style>
            .centered {
                background-color: #33813C;
                border-radius: 12px 12px 12px 12px;
                min-width: 70%;
                min-height: 70%;
                margin: auto;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="centered column responsive-container">
                <div class="logo-container">
                    <img class="logo-size" src="./assets/img/1200px-Logo_of_North_Sumatra_University.svg.png" alt="logo usu" />
                </div>
                <form class="content-container" action="<?php echo base_url('survei/createSurvei/doCreate?id='.$id); ?>" method="post" >
                    <div>
                        <h1><?php echo $appsProfile->apps_name; ?></h1>
                        <p class="uppercase"><?php echo $survei[0]->kategori; ?></p>
						<?php if($survei[0]->sub_category) { ?>
							<p class="uppercase"><?php echo $survei[0]->sub_category; ?></p>
						<?php } ?>
                    </div>
                    <?php echo $this->session->flashdata('notif'); ?>
                    <?php if($detailSurvei[0]->status == 'Belum Digunakan') { ?>
					<?php if($detailSurvei[0]->start_date <= date('Y-m-d') && $detailSurvei[0]->end_date >= date('Y-m-d')) { ?>
                    <div>
					    <div class="form-input">
                            <label>Full Name </label>
                            <input class="input-field" type="text" name="nama_surveyor" required/>
                        </div>
                        <div class="form-input">
                            <label>Email </label>
                            <input class="input-field" placeholder="ex: JohnDoe@mail.com" type="email" name="email_surveyor" required/>
                        </div>
                    </div>
                    <div class="form-button">
                        <button class="btn-survey">Isi Survey</button>
                    </div>
                    <?php } else { ?>
						<br>
						<div class="alert alert-danger">Tidak dalam waktu pengisian survei</div>
					<?php } ?>
					<?php }else{ ?>
						<br>
						<?php if($this->session->flashdata('notif')){?>
						<?php }else{?>
                            <center>
						        <div class="alert alert-danger">Survei Dengan Link Ini Sudah Di Isi</div>
                            </center>
						<?php } ?>
					<?php } ?>
                    <div class="footer"><p>Powered By<br> <a class="linkto" href="">Universitas Sumatera Utara</a></p></div>
                </form>
            </div>
        </div>
    </body>
</html>