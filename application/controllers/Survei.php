<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Survei extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index($param1='')
	{
		$id = $this->input->get('id');
		if($id){
			$survei = $this->GeneralModel->get_by_id_general('survei_detail_survei','kode_survei',$id);
			if($survei){
			$data['id'] = $id;
			$survei = $this->GeneralModel->get_by_id_general('survei_detail_survei','kode_survei',$id);
			$id_survei = $survei[0]->id_survei;
			$data['survei'] = $this->GeneralModel->get_by_id_general('survei_daftar_survei','id_daftar_survei',$id_survei);
			$data['detailSurvei'] = $this->GeneralModel->get_by_id_general('survei_detail_survei','kode_survei',$id);
			$data['appsProfile'] = $this->SettingsModel->get_profile();
			$this->load->view('survei/index',$data);
			}
		}
		
	}

	public function createSurvei($param1='')
	{
		if ($param1 == 'doCreate') {
			$id = $this->input->get('id');
			$dataIsiSurvei = array(
				'nama_surveyor' => $this->input->post('nama_surveyor'),
				'email_surveyor' => $this->input->post('email_surveyor'),
			);
			$this->session->set_userdata($dataIsiSurvei);
			redirect('survei/createSurvei?id='.$id);
		}else{
			$id = $this->input->get('id');
			$data['id'] = $id;
			$survei = $this->GeneralModel->get_by_id_general('survei_detail_survei','kode_survei',$id);
			$id_survei = $survei[0]->id_survei;
			$data['pertanyaan'] = $this->GeneralModel->get_general('survei_pertanyaan');
			$data['survei'] = $this->GeneralModel->get_by_id_general('survei_daftar_survei','id_daftar_survei',$id_survei);
			$data['appsProfile'] = $this->SettingsModel->get_profile();
			$data['content'] = 'survei/isiSurvei';
			$this->load->view('survei/content',$data);
		}
	}

	public function submitSurvei()
	{
		$id = $this->input->get('id');
		$detailSurvei = $this->GeneralModel->get_by_id_general('survei_detail_survei','kode_survei',$id);
		$survei = $this->GeneralModel->get_by_id_general('survei_daftar_survei','id_daftar_survei',$detailSurvei[0]->id_survei);
		$question = $this->input->post('id_pertanyaan'); 
		$answer = $this->input->post('jawaban'); 
		$data = array();
		$jumlahPertanyaan = count($question);
		$index = 0; 
		$dataJawaban = array();
		for($i=0;$i<$jumlahPertanyaan;$i++){
			$dataJawaban[$i] = array(
				'id_pertanyaan' => $question[$i],
				'jawaban' => $answer[$i+1],
				'nama_surveyor' => $this->session->userdata('nama_surveyor'),
				'email_surveyor' => $this->session->userdata('email_surveyor'),
				'id_detail_survei' => $detailSurvei[0]->id_detail_survei,
				'standar_pelayanan' => $survei[0]->standar_pelayanan,
				'created_by' => $this->session->userdata('id_pengguna'),
				'created_time' => date('Y-m-d H:i:s')
			);
			$this->db->insert('survei_jawaban', $dataJawaban[$i]);
		}
		$dataStatusSurvei = array(
			'status' => 'Digunakan'
		);
		$this->GeneralModel->update_general('survei_detail_survei', 'id_detail_survei', $detailSurvei[0]->id_detail_survei, $dataStatusSurvei);
		$this->session->unset_userdata('nama_surveyor');
		$this->session->unset_userdata('email_surveyor');
		$this->session->set_flashdata('notif', '<div class="alert alert-success">Terima Kasih Sudah Mengisi Survei</div>');
		redirect('survei?id='.$id);

	}
}
