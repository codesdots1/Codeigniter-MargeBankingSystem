<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Education extends DT_CI_Controller {


	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_education");
		$this->lang->load('education');
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

		$data['v_educationModal'] = $this->load->view('education/v_educationModal', '', TRUE);
		$this->dt_ci_template->load("default", "education/v_education", $data);
	}

	public function getEducationListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("te.education_id,te.education_name");
		$this->datatables->from("tbl_education as te");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$educationId   = $this->input->post('education_id');
		$educationName = $this->input->post('education_name');

		if (isset($educationId) && $educationId == '') {
			$this->form_validation->set_rules('education_name', $this->lang->line('education_name'), 'required|is_unique[tbl_education.education_name]');
		} else {
			$this->form_validation->set_rules('education_name', $this->lang->line('education_name'), 'required|edit_unique[tbl_education.education_name.' . $educationId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$educationArray =	array(
				'education_id'	  => $educationId,
				'education_name'  => $educationName,
			);
			$educationData = $this->Mdl_education->insertUpdateRecord($educationArray, 'education_id', 'tbl_education', 1);

			if (isset($educationId) && $educationId != '') {
				if ($educationData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'), EDUCATION);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), EDUCATION);
				}
			} else {
				if ($educationData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), EDUCATION);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), EDUCATION);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$educationId   = $this->input->post('deleteId',TRUE);
		$educationData = $this->Mdl_education->deleteRecord($educationId);

		if ($educationData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),EDUCATION);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),EDUCATION);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$educationId 	  = $this->input->post('educationId');
		$data['get_data'] = $this->Mdl_education->getData($educationId);
		echo json_encode($data['get_data']);
	}


	public function getEducationDD(){
		$filterParameter = $this->input->post('filter_param');
		$educationIdActive = $this->input->post('educationIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_education->getEducationDD($filterParameter,$page,$educationIdActive);
	}
}
