<?php
        $appsProfile = $this->SettingsModel->get_profile();

        $this->load->view('panel/templates/header',$appsProfile);
        $this->load->view($content);
        $this->load->view('panel/templates/footer');
?>
