<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gender extends DT_CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_gender");
		$this->lang->load('gender');
	}

	//Index page
	public function index()
	{
		$data['extra_js'] = array(
			"js/plugins/tables/datatables/datatables.min.js",
			"js/plugins/notifications/sweet_alert.min.js",
			"js/plugins/forms/styling/uniform.min.js",
			"js/plugins/forms/jquery.form.min.js",
		);

		$data['v_genderModal'] = $this->load->view('gender/v_genderModal', '', TRUE);
		$this->dt_ci_template->load("default", "gender/v_gender", $data);
	}

	public function getGenderListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("tg.gender_id,tg.gender_name");
		$this->datatables->from("tbl_gender as tg");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$genderId   = $this->input->post('gender_id');
		$genderName = $this->input->post('gender_name');

		if (isset($genderId) && $genderId == '') {
			$this->form_validation->set_rules('gender_name', $this->lang->line('gender_name'), 'required|is_unique[tbl_gender.gender_name]');
		} else {
			$this->form_validation->set_rules('gender_name', $this->lang->line('gender_name'), 'required|edit_unique[tbl_gender.gender_name.' . $genderId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$genderArray =	array(
				'gender_id'	  => $genderId,
				'gender_name' => $genderName,
			);
			$genderData = $this->Mdl_gender->insertUpdateRecord($genderArray, 'gender_id', 'tbl_gender', 1);

			if (isset($genderId) && $genderId != '') {
				if ($genderData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'), GENDER);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), GENDER);
				}
			} else {
				if ($genderData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), GENDER);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), GENDER);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$genderId   = $this->input->post('deleteId',TRUE);
		$genderData = $this->Mdl_gender->deleteRecord($genderId);

		if ($genderData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),GENDER);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),GENDER);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$genderId 	      = $this->input->post('genderId');
		$data['get_data'] = $this->Mdl_gender->getData($genderId);
		echo json_encode($data['get_data']);
	}


	public function getGenderDD(){
		$filterParameter = $this->input->post('filter_param');
		$genderIdActive = $this->input->post('genderIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_gender->getGenderDD($filterParameter,$page,$genderIdActive);
	}

}
