<?php

defined('BASEPATH') or exit('No direct script access allowed');

class MasterData extends CI_Controller
{

	public $parent_modul = 'Master Data';
	public $title = 'Master Data';

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('LoggedIN') == FALSE) redirect('auth/logout');
		$this->akses_controller = $this->uri->segment(3);
	}

	//--------------- PENGGUNA BEGIN------------------//
	public function pengguna($param1 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if($param1=='cari'){
			$hak_akses = $this->input->post('hak_akses');
			$status_pengguna = $this->input->post('status_pengguna');
			return $this->PenggunaModel->getPengguna($hak_akses,$status_pengguna);
		}else{
			$data['title'] = $this->title;
			$data['subtitle'] = 'List User';
			$data['content'] = 'panel/masterData/pengguna/index';
			$data['getHakAkses'] = $this->GeneralModel->get_general('survei_hak_akses');
			$data['status'] = $this->input->get('status');
			$data['hak_akses'] = $this->input->get('hak_akses');
			$this->load->view('panel/content', $data);
		}
	}

	public function cekUsernamePengguna()
	{
		$username = $this->input->get('username');
		if ($this->GeneralModel->get_by_id_general('survei_pengguna', 'username', $username) == true) {
			echo "FALSE";
		} else {
			echo "TRUE";
		}
	}

	public function createPengguna($param1='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1=='doCreate') {
			$dataPengguna = array(
				'username' => $this->input->post('username'),
				'password' => sha1($this->input->post('password')),
				'email' => $this->input->post('email'),
				'hak_akses' => $this->input->post('hak_akses'),
				'nama_lengkap' => $this->input->post('nama_lengkap'),
				'jenkel' => $this->input->post('jenkel'),
				'alamat' => $this->input->post('alamat'),
				'no_hp' => $this->input->post('no_hp'),
				'unit' => $this->input->post('unit'),
				'tgl_lahir' => $this->input->post('tgl_lahir'),
				'created_by' => $this->session->userdata('id_pengguna'),
			);

			//---------------- UPDATE FOTO PENGGUNA ---------------//
			$config['upload_path']          = 'assets/img/pengguna/';
			$config['allowed_types']        = 'gif|jpg|png|jpeg';
			$config['max_size']             = 10000;


			$this->upload->initialize($config);

			if (!$this->upload->do_upload('foto_pengguna')) {
			} else {
				$dataPengguna += array('foto_pengguna' => $config['upload_path'] . $this->upload->data('file_name'));
			}
			if ($this->GeneralModel->get_by_id_general('survei_pengguna','username',$dataPengguna['username']) == false) {
				if ($this->GeneralModel->create_general('survei_pengguna', $dataPengguna) == true) {
					$this->session->set_flashdata('notif', '<div class="alert alert-success">User added successfully</div>');
					redirect(changeLink('panel/masterData/pengguna'));
				} else {
					$this->session->set_flashdata('notif', '<div class="alert alert-danger">User failed to add</div>');
					redirect(changeLink('panel/masterData/createPengguna'));
				}
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">User failed to add, username has been used</div>');
				redirect(changeLink('panel/settings/createPengguna'));
			}
		}else{
			$data['title'] = $this->title;
			$data['subtitle'] = 'Add User';
			$data['content'] = 'panel/masterData/pengguna/create';
			$data['unit'] = $this->GeneralModel->get_general('survei_kategori');
			$data['hakAkses'] = $this->GeneralModel->get_general('survei_hak_akses');
			$this->load->view('panel/content', $data);
		}
	}

	public function updatePengguna($param1 = '',$param2 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doUpdate') {
			$dataPengguna = array(
				'email' => $this->input->post('email'),
				'hak_akses' => $this->input->post('hak_akses'),
				'nama_lengkap' => $this->input->post('nama_lengkap'),
				'jenkel' => $this->input->post('jenkel'),
				'alamat' => $this->input->post('alamat'),
				'no_hp' => $this->input->post('no_hp'),
				'unit' => $this->input->post('unit'),
				'status_pengguna' => $this->input->post('status_pengguna'),
				'tgl_lahir' => $this->input->post('tgl_lahir'),
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => DATE("Y-m-d H:i:s")
			);
			//---------------- UPDATE FOTO PENGGUNA ---------------//
			$config['upload_path']          = 'assets/img/pengguna/';
			$config['allowed_types']        = 'gif|jpg|png|jpeg';
			$config['max_size']             = 10000;


			$this->upload->initialize($config);

            $pengguna = $this->GeneralModel->get_by_id_general('survei_pengguna', 'id_pengguna', $param2);
			if (!$this->upload->do_upload('foto_pengguna')) {
			} else {
				$dataPengguna += array('foto_pengguna' => $config['upload_path'] . $this->upload->data('file_name'));
				if (!empty($pengguna[0]->foto_pengguna)) {
					try {
						unlink($pengguna[0]->foto_pengguna);
					} catch (\Exception $e) {
					}
				}
			}
			if ($this->session->userdata('id_pengguna') == $param2) {
				$this->session->set_userdata($dataPengguna);
			}
			if (!empty($this->input->post('password'))) {
				if ($this->input->post('password') == $this->input->post('re_password')) {
					$dataPengguna += array(
						'password' => sha1($this->input->post('password')),
					);
					$this->session->set_flashdata('notifpass', '<div class="alert alert-success">Password changed successfully</div>');
				} else {
					$this->session->set_flashdata('notifpass', '<div class="alert alert-danger">Password failed to change because it is not the same as repeat password_usera</div>');
				}
			}

			if ($this->GeneralModel->update_general('survei_pengguna', 'id_pengguna', $param2, $dataPengguna) == true) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">User has been successfully updated</div>');
				redirect(changeLink('panel/masterData/pengguna'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">User failed to update</div>');
				redirect(changeLink('panel/masterData/updatePengguna' . $pengguna[0]->id_pengguna));
			}
		}elseif($param1=='aktifkan'){
			$dataPengguna = array(
				'status_pengguna' => '1',
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => DATE('Y-m-d H:i:s'),
			);
			if ($this->GeneralModel->update_general('survei_pengguna', 'id_pengguna', $param2, $dataPengguna) == true) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">User has been successfully updated</div>');
				redirect(changeLink('panel/masterData/pengguna'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">User failed to update</div>');
				redirect(changeLink('panel/masterData/pengguna'));
			}
		}elseif($param1=='nonAktifkan'){
			$dataPengguna = array(
				'status_pengguna' => '0',
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => DATE('Y-m-d H:i:s'),
			);
			if ($this->GeneralModel->update_general('survei_pengguna', 'id_pengguna', $param2, $dataPengguna) == true) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">User has been successfully updated</div>');
				redirect(changeLink('panel/masterData/pengguna'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">User failed to update</div>');
				redirect(changeLink('panel/masterData/pengguna'));
			}
		}elseif($param1=='resetPassword'){
			$dataPengguna = array(
				'password' => sha1(12345678),
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => DATE('Y-m-d H:i:s'),
			);
			if ($this->GeneralModel->update_general('survei_pengguna', 'id_pengguna', $param2, $dataPengguna) == true) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">User password has been changed successfully</div>');
				redirect(changeLink('panel/masterData/pengguna'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">User password failed to change</div>');
				redirect(changeLink('panel/masterData/pengguna'));
			}
		}else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Update User';
			$data['content'] = 'panel/masterData/pengguna/update';
			$data['unit'] = $this->GeneralModel->get_general('survei_kategori');
			$data['hakAkses'] = $this->GeneralModel->get_general('survei_hak_akses');
			$data['pengguna'] = $this->GeneralModel->get_by_id_general('survei_pengguna','id_pengguna',$param1);
			$this->load->view('panel/content', $data);
		}
	}

	public function deletePengguna($param1 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		$pengguna = $this->GeneralModel->get_by_id_general('survei_pengguna', 'id_pengguna', $param1);
		if (!empty($pengguna[0]->foto_pengguna)) {
			try {
				unlink($pengguna[0]->foto_pengguna);
			} catch (\Exception $e) {
			}
		}
		if ($this->GeneralModel->delete_general('survei_pengguna', 'id_pengguna', $pengguna[0]->id_pengguna) == true) {
			$this->session->set_flashdata('notif', '<div class="alert alert-success">User deleted successfully</div>');
			redirect(changeLink('panel/masterData/pengguna'));
		} else {
			$this->session->set_flashdata('notif', '<div class="alert alert-danger">User failed to delete</div>');
			redirect(changeLink('panel/masterData/pengguna'));
		}
	}

	//--------------- HAK AKSES BEGIN------------------//
	public function hakAkses($param1 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
			$data['title'] = $this->title;
			$data['subtitle'] = 'List of Access';
			$data['content'] = 'panel/masterData/hakAkses/index';
			$data['hak_akses'] = $this->AksesModulModel->getHakAkses();
			$this->load->view('panel/content', $data);
	}

	public function createHakAkses($param1 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
			
		if ($param1 == 'doCreate') {
			$nama_hak_akses = $this->input->post('nama_hak_akses');
			$parent_modul = $this->input->post('class_parent_modul');
			$parent_modul = array_unique($parent_modul);
			$parent_modul = array_values(array_unique($parent_modul));

			$parent_modul = array(
				"parent_modul" => $parent_modul,
			);
			$parent_modul = json_encode($parent_modul, JSON_PRETTY_PRINT);

			$modul = $this->input->post('controller_modul');
			$modul = array(
				"modul" => $modul,
			);

			$modul = json_encode($modul, JSON_PRETTY_PRINT);

			$data = array(
				'nama_hak_akses' => $nama_hak_akses,
				'modul_akses' => $modul,
				'parent_modul_akses' => $parent_modul,
			);

			if ($this->GeneralModel->create_general('survei_hak_akses', $data) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Access added successfully</div>');
				redirect(changeLink('panel/masterData/hakAkses/'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Access failed to add</div>');
				redirect(changeLink('panel/masterData/hakAkses/'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Add Access';
			$data['content'] = 'panel/masterData/hakAkses/create';
			$data['parentModul'] = $this->GeneralModel->get_general_order_by('survei_parent_modul', 'urutan', 'ASC');
			$this->load->view('panel/content', $data);
		}
	}

	public function updateHakAkses($param1 = '', $param2 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doUpdate') {
			$nama_hak_akses = $this->input->post('nama_hak_akses');
			$parent_modul = $this->input->post('class_parent_modul');
			$parent_modul = array_unique($parent_modul);
			$parent_modul = array_values(array_unique($parent_modul));

			$parent_modul = array(
				"parent_modul" => $parent_modul,
			);
			$parent_modul = json_encode($parent_modul, JSON_PRETTY_PRINT);

			$modul = $this->input->post('controller_modul');
			$modul = array(
				"modul" => $modul,
			);

			$modul = json_encode($modul, JSON_PRETTY_PRINT);

			$data = array(
				'nama_hak_akses' => $nama_hak_akses,
				'modul_akses' => $modul,
				'parent_modul_akses' => $parent_modul,
			);

			if ($this->GeneralModel->update_general('survei_hak_akses', 'id_hak_akses', $param2, $data) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Access successfully updated</div>');
				redirect(changeLink('panel/masterData/hakAkses/'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Access failed to update</div>');
				redirect(changeLink('panel/masterData/hakAkses/'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Update Access';
			$data['content'] = 'panel/masterData/hakAkses/update';
			$data['id'] = $param1;
			$data['hak_akses'] = $this->GeneralModel->get_by_id_general('survei_hak_akses', 'id_hak_akses', $param1);
			$data['parentModul'] = $this->GeneralModel->get_general_order_by('survei_parent_modul', 'urutan', 'ASC');
			$this->load->view('panel/content', $data);
		}
	}

	public function deleteHakAkses($param1 = '')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($this->GeneralModel->delete_general('survei_hak_akses', 'id_hak_akses', $param1) == TRUE) {
			$this->session->set_flashdata('notif', '<div class="alert alert-success">Access deleted successfully</div>');
			redirect(changeLink('panel/masterData/hakAkses/'));
		} else {
			$this->session->set_flashdata('notif', '<div class="alert alert-danger">Access failed to delete</div>');
			redirect(changeLink('panel/masterData/hakAkses/'));
		}
	}

	//--------------- CATEGORY BEGIN------------------//

	public function categories($param1='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if($param1=='cari'){
			return $this->MasterDataModel->getCategory();
		}else{
			$data['title'] = $this->title;
			$data['subtitle'] = 'List Of Categories';
			$data['content'] = 'panel/masterData/category/index';
			$this->load->view('panel/content', $data);
		}
	}

	public function createCategory($param1='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doCreate') {
			$nama_kategori = $this->input->post('nama_kategori');
			$data = array(
				'nama_kategori' => strtoupper($nama_kategori),
				'created_by' => $this->session->userdata('id_pengguna'),
				'created_time' => date('Y-m-d H:i:s')
			);

			if ($this->GeneralModel->create_general('survei_kategori', $data) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Category added successfully</div>');
				redirect(changeLink('panel/masterData/categories/'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Category failed to add</div>');
				redirect(changeLink('panel/masterData/categories/'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Add Category';
			$data['content'] = 'panel/masterData/category/create';
			$this->load->view('panel/content', $data);
		}
	}

	public function updateCategory($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doUpdate') {
			$nama_kategori = $this->input->post('nama_kategori');
			$data = array(
				'nama_kategori' => strtoupper($nama_kategori),
			);

			if ($this->GeneralModel->update_general('survei_kategori', 'id_kategori', $param2, $data) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Category successfully updated</div>');
				redirect(changeLink('panel/masterData/categories/'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Category failed to update</div>');
				redirect(changeLink('panel/masterData/categories/'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Update Category';
			$data['content'] = 'panel/masterData/category/update';
			$data['id'] = $param1;
			$data['category'] = $this->GeneralModel->get_by_id_general('survei_kategori', 'id_kategori', $param1);
			$this->load->view('panel/content', $data);
		}
	}

	public function deleteCategory($param1='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($this->GeneralModel->delete_general('survei_kategori', 'id_kategori', $param1) == TRUE) {
			$this->session->set_flashdata('notif', '<div class="alert alert-success">Category deleted successfully</div>');
			redirect(changeLink('panel/masterData/categories/'));
		} else {
			$this->session->set_flashdata('notif', '<div class="alert alert-danger">Category failed to delete</div>');
			redirect(changeLink('panel/masterData/categories/'));
		}
	}

	//--------------- SERVICE BEGIN------------------//

	public function services($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if($param1=='cari'){
			$kategori_unit = $this->input->post('kategori_unit');
			return $this->MasterDataModel->getService($kategori_unit);
		}else{
			$data['title'] = $this->title;
			$data['subtitle'] = 'List Of Services';
			$data['content'] = 'panel/masterData/service/index';
			$data['category'] = $this->GeneralModel->get_general('survei_kategori');
			$data['kategori_unit'] = $this->input->get('category');
			$this->load->view('panel/content', $data);
		}
	}

	public function createService($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doCreate') {
			$nama_unit_kerja = $this->input->post('nama_unit_kerja');
			$kategori_unit = $this->input->post('kategori_unit');
			$dataService = array(
				'nama_unit_kerja' => strtoupper($nama_unit_kerja),
				'kategori_unit' => $kategori_unit,
				'keterangan_standar_pelayanan' => $this->input->post('keterangan_standar_pelayanan'),
				'created_by' => $this->session->userdata('id_pengguna'),
				'created_time' => date('Y-m-d H:i:s')
			);

			if ($this->GeneralModel->create_general('survei_standar_pelayanan', $dataService) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Service added successfully</div>');
				redirect(changeLink('panel/masterData/services?category='.$kategori_unit));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Service failed to add</div>');
				redirect(changeLink('panel/masterData/services?category='.$kategori_unit));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Add Service';
			$data['content'] = 'panel/masterData/service/create';
			$data['kategori_unit'] = $this->input->get('category');
			$data['category'] = $this->GeneralModel->get_general('survei_kategori');
			$this->load->view('panel/content', $data);
		}
	}

	public function updateService($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doUpdate') {
			$nama_unit_kerja = $this->input->post('nama_unit_kerja');
			$kategori_unit = $this->input->post('kategori_unit');
			$data = array(
				'nama_unit_kerja' => strtoupper($nama_unit_kerja),
				'kategori_unit' => $kategori_unit,
				'keterangan_standar_pelayanan' => $this->input->post('keterangan_standar_pelayanan'),
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => date('Y-m-d H:i:s')
			);

			if ($this->GeneralModel->update_general('survei_standar_pelayanan', 'id_standar_pelayanan', $param2, $data) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Service successfully updated</div>');
				redirect(changeLink('panel/masterData/services?category='.$kategori_unit));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Service failed to update</div>');
				redirect(changeLink('panel/masterData/services?category='.$kategori_unit));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Update Service';
			$data['content'] = 'panel/masterData/service/update';
			$data['id'] = $param1;
			$data['service'] = $this->GeneralModel->get_by_id_general('survei_standar_pelayanan', 'id_standar_pelayanan', $param1);
			$data['kategori_unit'] = $this->input->get('category');
			$data['category'] = $this->GeneralModel->get_general('survei_kategori');
			$this->load->view('panel/content', $data);
		}
	}

	public function deleteService($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		$cekData = $this->GeneralModel->get_by_id_general('survei_standar_pelayanan', 'id_standar_pelayanan', $param1);
		if ($this->GeneralModel->delete_general('survei_standar_pelayanan', 'id_standar_pelayanan', $param1) == TRUE) {
			$this->session->set_flashdata('notif', '<div class="alert alert-success">Service successfully deleted</div>');
			redirect(changeLink('panel/masterData/services?category='.$cekData[0]->kategori_unit));
		} else {
			$this->session->set_flashdata('notif', '<div class="alert alert-danger">Service failed to delete</div>');
			redirect(changeLink('panel/masterData/services?category='.$cekData[0]->kategori_unit));
		}
	}

	//--------------- QUESTION BEGIN------------------//

	public function question($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if($param1=='cari'){
			return $this->MasterDataModel->getQuestion();
		}else{
			$data['title'] = $this->title;
			$data['subtitle'] = 'List Of Question';
			$data['content'] = 'panel/masterData/question/index';
			$this->load->view('panel/content', $data);
		}
	}

	public function createQuestion($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doCreate') {
			$dataQuestion = array(
				'pertanyaan' => strtoupper($this->input->post('pertanyaan')),
				'kategori_jawaban' => $this->input->post('kategori_jawaban'),
				'created_by' => $this->session->userdata('id_pengguna'),
				'created_time' => date('Y-m-d H:i:s')
			);

			if ($this->GeneralModel->create_general('survei_pertanyaan', $dataQuestion) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Question added successfully</div>');
				redirect(changeLink('panel/masterData/question'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Question failed to add</div>');
				redirect(changeLink('panel/masterData/question'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Add Question';
			$data['content'] = 'panel/masterData/question/create';
			$this->load->view('panel/content', $data);
		}
	}

	public function updateQuestion($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		if ($param1 == 'doUpdate') {
			$data = array(
				'pertanyaan' => strtoupper($this->input->post('pertanyaan')),
				'kategori_jawaban' => $this->input->post('kategori_jawaban'),
				'updated_by' => $this->session->userdata('id_pengguna'),
				'updated_time' => date('Y-m-d H:i:s')
			);

			if ($this->GeneralModel->update_general('survei_pertanyaan', 'id_pertanyaan', $param2, $data) == TRUE) {
				$this->session->set_flashdata('notif', '<div class="alert alert-success">Question successfully updated</div>');
				redirect(changeLink('panel/masterData/question'));
			} else {
				$this->session->set_flashdata('notif', '<div class="alert alert-danger">Question failed to update</div>');
				redirect(changeLink('panel/masterData/question'));
			}
		} else {
			$data['title'] = $this->title;
			$data['subtitle'] = 'Update Question';
			$data['content'] = 'panel/masterData/question/update';
			$data['id'] = $param1;
			$data['question'] = $this->GeneralModel->get_by_id_general('survei_pertanyaan', 'id_pertanyaan', $param1);
			$this->load->view('panel/content', $data);
		}
	}

	public function deleteQuestion($param1='',$param2='')
	{
		if (cekModul($this->akses_controller) == FALSE) redirect('auth/access_denied');
		$cekData = $this->GeneralModel->get_by_id_general('survei_pertanyaan', 'id_pertanyaan', $param1);
		$data = array(
			'status' => 0,
			'updated_by' => $this->session->userdata('id_pengguna'),
			'updated_time' => date('Y-m-d H:i:s')
		);
		if ($this->GeneralModel->update_general('survei_pertanyaan', 'id_pertanyaan', $param1, $data) == TRUE) {
			$this->session->set_flashdata('notif', '<div class="alert alert-success">Question successfully deleted</div>');
			redirect(changeLink('panel/masterData/question'));
		} else {
			$this->session->set_flashdata('notif', '<div class="alert alert-danger">Question failed to delete</div>');
			redirect(changeLink('panel/masterData/question'));
		}
	}

}
