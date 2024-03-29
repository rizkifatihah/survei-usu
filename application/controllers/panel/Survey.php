<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Survey extends CI_Controller
{

	public $parent_modul = 'Survey';
	public $title = 'Survey';

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('LoggedIN') == FALSE) redirect('auth/logout');
		$this->akses_controller = $this->uri->segment(3);
	}


	//--------------- SURVEI BEGIN------------------//

	public function listSurvey($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if($this->session->userdata('unit') == ''){
				if (!empty($this->input->get('dari')) && !empty($this->input->get('sampai'))) {
					$data['dari'] = $this->input->get('dari');
					$data['sampai'] = $this->input->get('sampai');
				}else{
					$data['dari'] = "";
					$data['sampai'] = "";
				}
				if(!empty($this->input->get('unit'))){
					$data['unit'] = $this->input->get('unit');
				}else{
					$data['unit'] = "";
				}
				$unit = $data['unit'];
				$data['title'] = $this->title;
				$start_date = $this->input->get('dari');
				$end_date = $this->input->get('sampai');
				$data['subtitle'] = 'List Of Survey';
				$data['unitAll'] = $this->GeneralModel->get_general_order_by('survei_kategori','nama_kategori','ASC');
				$data['listSurvei'] = $this->SurveiModel->getListSurvei($start_date,$end_date,$unit);	
				$data['content'] = 'panel/survey/index';
				$this->load->view('panel/content', $data);
		}else{
				if (!empty($this->input->get('dari')) && !empty($this->input->get('sampai'))) {
					$data['dari'] = $this->input->get('dari');
					$data['sampai'] = $this->input->get('sampai');
					
				}else{
					$data['dari'] = "";
					$data['sampai'] = "";
				}
				if(!empty($this->input->get('unit'))){
					$data['unit'] = $this->input->get('unit');
				}else{
					$data['unit'] = $this->session->userdata('unit');
				}
				$start_date = $this->input->get('dari');
				$end_date = $this->input->get('sampai');
				$data['title'] = $this->title;
				$unit = $data['unit'];
				$data['listSurvei'] = $this->SurveiModel->getListSurvei($start_date,$end_date,$unit);	
				$data['subtitle'] = 'List Of Survey';
				$data['unit'] = $this->input->get('unit');
				$data['unitAll'] = $this->GeneralModel->get_by_id_general('survei_kategori','nama_kategori',$unit);
				$data['content'] = 'panel/survey/index';
				$this->load->view('panel/content', $data);
		}
	}

	public function createSurvey($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if($this->session->userdata('unit') == ''){
			if ($param1 == 'doCreate') {
				if($this->input->post('sub_category') == ''){
					$sub_category = null;
				}else{
					$sub_category = $this->input->post('sub_category');
				}
				$dataSurvey = array(
					'kategori' => $this->input->post('kategori'),
					'sub_category' => $sub_category,
					'jumlah_survei' => $this->input->post('jumlah_survei'),
					'mulai_survei' => $this->input->post('mulai_survei'),
					'selesai_survei' => $this->input->post('selesai_survei'),
					'created_by' => $this->session->userdata('id_pengguna'),
					'created_time' => date('Y-m-d H:i:s')
				);

				if ($this->GeneralModel->create_general('survei_daftar_survei', $dataSurvey) == TRUE) {
					$id = $this->db->insert_id();
					$dataDetailSurvei = array();
					$jumlah_survei = $this->input->post('jumlah_survei');
					for ($i=0; $i < $jumlah_survei; $i++) { 
						$randomCode = random_string('alnum', 12);
						$dataDetailSurvei[$i] = array(
							'id_survei' => $id,
							'kode_survei' => $randomCode,
							'status' => 'Belum Digunakan',
							'start_date' => $this->input->post('mulai_survei'),
							'end_date' => $this->input->post('selesai_survei'),
							'created_by' => $this->session->userdata('id_pengguna'),
							'created_time' => date('Y-m-d H:i:s')
						);
						$this->db->insert('survei_detail_survei', $dataDetailSurvei[$i]);
					}
					$this->session->set_flashdata('notif', '<div class="alert alert-success">Survey added successfully</div>');
					redirect(changeLink('panel/survey/listSurvey'));
				} else {
					$this->session->set_flashdata('notif', '<div class="alert alert-danger">Survey failed to add</div>');
					redirect(changeLink('panel/survey/listSurvey'));
				}
			}elseif($param1 == 'getStandart'){
				$kategori_unit = $this->input->get('kategori');
				$getKategori = $this->GeneralModel->get_by_id_general('survei_kategori','nama_kategori',$kategori_unit);
				$getStandart = $this->GeneralModel->get_by_id_general('survei_sub_kategori','kategori',$getKategori[0]->keterangan);
				if ($getStandart) {
					echo json_encode($getStandart,JSON_PRETTY_PRINT);
				}else{
					echo 'false';
				}
			} else {
				$data['title'] = $this->title;
				$data['subtitle'] = 'Add Survey';
				$data['content'] = 'panel/survey/create';
				$data['category'] = $this->GeneralModel->get_general_order_by('survei_kategori','nama_kategori','ASC');
				$this->load->view('panel/content', $data);
			}
		}else{
			if ($param1 == 'doCreate') {
				$dataSurvey = array(
					'kategori' => $this->input->post('kategori'),
					'jumlah_survei' => $this->input->post('jumlah_survei'),
					'standar_pelayanan' => $this->input->post('standar_pelayanan'),
					'mulai_survei' => $this->input->post('mulai_survei'),
					'selesai_survei' => $this->input->post('selesai_survei'),
					'created_by' => $this->session->userdata('id_pengguna'),
					'created_time' => date('Y-m-d H:i:s')
				);

				if ($this->GeneralModel->create_general('survei_daftar_survei', $dataSurvey) == TRUE) {
					$id = $this->db->insert_id();
					$dataDetailSurvei = array();
					$jumlah_survei = $this->input->post('jumlah_survei');
					for ($i=0; $i < $jumlah_survei; $i++) { 
						$randomCode = random_string('alnum', 12);
						$dataDetailSurvei[$i] = array(
							'id_survei' => $id,
							'kode_survei' => $randomCode,
							'standar_pelayanan' => $this->input->post('standar_pelayanan'),
							'status' => 'Belum Digunakan',
							'start_date' => $this->input->post('mulai_survei'),
							'end_date' => $this->input->post('selesai_survei'),
							'created_by' => $this->session->userdata('id_pengguna'),
							'created_time' => date('Y-m-d H:i:s')
						);
						$this->db->insert('survei_detail_survei', $dataDetailSurvei[$i]);
					}
					$this->session->set_flashdata('notif', '<div class="alert alert-success">Survey added successfully</div>');
					redirect(changeLink('panel/survey/listSurvey'));
				} else {
					$this->session->set_flashdata('notif', '<div class="alert alert-danger">Survey failed to add</div>');
					redirect(changeLink('panel/survey/listSurvey'));
				}
			}elseif($param1 == 'getStandart'){
				$kategori_unit = $this->input->get('kategori');
				$getStandart = $this->GeneralModel->get_by_id_general('survei_standar_pelayanan','kategori_unit',$kategori_unit);
				if ($getStandart) {
					echo json_encode($getStandart,JSON_PRETTY_PRINT);
				}else{
					echo 'false';
				}
			} else {
				$data['title'] = $this->title;
				$data['subtitle'] = 'Add Survey';
				$data['content'] = 'panel/survey/create';
				$data['category'] = $this->GeneralModel->get_by_id_general('survei_kategori','nama_kategori',$this->session->userdata('unit'));
				$this->load->view('panel/content', $data);
			}
		}
	}

	public function updateSurvey($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doUpdate') {
			$data = array(
				'kategori' => $this->input->post('kategori'),
				'jumlah_survei' => $this->input->post('jumlah_survei'),
                'mulai_survei' => $this->input->post('mulai_survei'),
                'selesai_survei' => $this->input->post('selesai_survei'),
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => date('Y-m-d H:i:s')
			);

			if ($this->GeneralModel->update_general('survei_daftar_survei', 'id_daftar_survei', $param2, $data) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Survey successfully updated</div>');
				redirect(changeLink('panel/survey/listSurvey'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Survey failed to update</div>');
				redirect(changeLink('panel/survey/listSurvey'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Update Survey';
			$data['content'] = 'panel/survey/update';
			$data['id'] = $param1;
			$data['survey'] = $this->GeneralModel->get_by_id_general('survei_daftar_survei', 'id_daftar_survei', $param1);
			$this->load->view('panel/content', $data);
		}
	}

	public function deleteSurvey($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		$cekData = $this->GeneralModel->get_by_id_general('survei_daftar_survei', 'id_daftar_survei', $param1);
		$data = array(
			'status_survei' => 0,
			'updated_by' => $this->session->userdata('id_pengguna'),
			'updated_time' => date('Y-m-d H:i:s')
		);
		if ($this->GeneralModel->update_general('survei_daftar_survei', 'id_daftar_survei', $param1, $data) == TRUE) {
			$this->session->set_flashdata('notif', '<div class="alert alert-success">Survey successfully deleted</div>');
			redirect(changeLink('panel/survey/listSurvey'));
		} else {
			$this->session->set_flashdata('notif', '<div class="alert alert-danger">Survey failed to delete</div>');
			redirect(changeLink('panel/survey/listSurvey'));
		}
	}

    //--------------- DETAIL SURVEI BEGIN------------------//

	public function detailSurvey($param1='',$param2='')
	{
			$data['title'] = $this->title;
            $data['id'] = $param1;
			$data['detailSurvei'] = $this->GeneralModel->get_by_id_general('survei_detail_survei','id_survei',$param1);
			$data['subtitle'] = 'List Of Detail Survey';
			$data['content'] = 'panel/survey/detail/index';
			$this->load->view('panel/content', $data);
	}

	public function answerSurvei($param1='',$param2='')
	{
		if($param1 == 'excel'){
			$data['title'] = $this->title;
			$data['detailSurvei'] = $this->GeneralModel->get_by_id_general('survei_detail_survei','id_detail_survei',$param2);
			$data['pertanyaan'] = $this->GeneralModel->get_general('survei_pertanyaan');
			$data['id'] = $param2;
			$data['jawaban'] = $this->GeneralModel->get_by_id_general('survei_jawaban','id_detail_survei',$param2);
			$this->load->view('panel/survey/printJawabanSurvei', $data);
		}else if($param1 == 'excelAll'){
			$data['title'] = $this->title;
			$data['detailSurvei'] = $this->GeneralModel->get_by_id_general('survei_detail_survei','id_survei',$param2);
			$data['pertanyaan'] = $this->GeneralModel->get_general('survei_pertanyaan');
			$data['id'] = $param2;
			$data['jawaban'] = $this->GeneralModel->get_by_id_general('survei_jawaban','id_survei',$param2);
			$this->load->view('panel/survey/printJawabanSurveiAll', $data);
		}else{
			$data['title'] = $this->title;
			$data['subtitle'] = 'Answer Survey';
			$data['content'] = 'panel/survey/detail/answer';
			$data['detailSurvei'] = $this->GeneralModel->get_by_id_general('survei_detail_survei','id_detail_survei',$param1);
			$data['pertanyaan'] = $this->GeneralModel->get_general('survei_pertanyaan');
			$data['id'] = $param1;
			$data['jawaban'] = $this->GeneralModel->get_by_id_general('survei_jawaban','id_detail_survei',$param1);
			$this->load->view('panel/content', $data);
		}
	}

}
