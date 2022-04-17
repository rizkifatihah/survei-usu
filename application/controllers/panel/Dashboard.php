<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public $parent_modul = 'Dashboard';
	public $title = 'Dashboard';

	public function __construct(){
		parent::__construct();
		if($this->session->userdata('LoggedIN') == FALSE ) redirect('auth/logout');
	}

	public function index()
	{
		if($this->session->userdata('unit') == ''){
			$data['title'] = $this->title;
			$data['subtitle'] = 'Dashboard';
			$data['daftarSurvei'] = $this->db->query("SELECT * FROM survei_daftar_survei WHERE status_survei = '1'")->result();
			$data['content'] = 'panel/dashboard/index';
			$this->load->view('panel/content', $data);
		}else{
			$data['title'] = $this->title;
			$data['subtitle'] = 'Dashboard';
			$unit = $this->session->userdata('unit');
			$data['daftarSurvei'] = $this->db->query("SELECT * FROM survei_daftar_survei WHERE kategori = '$unit' AND status_survei = '1'")->result();
			$data['content'] = 'panel/dashboard/index';
			$this->load->view('panel/content', $data);
		}
	}

	public function timeNow()
	{
		date_default_timezone_set('Asia/Jakarta');
  		echo $runningTime = date('H:i:s');
	}

}
