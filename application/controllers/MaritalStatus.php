<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MaritalStatus extends DT_CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_marital_status");
		$this->lang->load('marital_status');
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

		$data['v_marital_statusModal'] = $this->load->view('maritalStatus/v_marital_statusModal', '', TRUE);
		$this->dt_ci_template->load("default", "maritalStatus/v_marital_status", $data);
	}

	public function getMaritalStatusListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("tms.marital_status_id,tms.marital_status_name");
		$this->datatables->from("tbl_marital_status as tms");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$maritalStatusId   = $this->input->post('marital_status_id');
		$maritalStatusName = $this->input->post('marital_status_name');

		if (isset($maritalStatusId) && $maritalStatusId == '') {
			$this->form_validation->set_rules('marital_status_name', $this->lang->line('marital_status_name'), 'required|is_unique[tbl_marital_status.marital_status_name]');
		} else {
			$this->form_validation->set_rules('marital_status_name', $this->lang->line('marital_status_name'), 'required|edit_unique[tbl_marital_status.marital_status_name.' . $maritalStatusId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$maritalStatusArray =	array(
				'marital_status_id'	  => $maritalStatusId,
				'marital_status_name' => $maritalStatusName,
			);
			$maritalStatusData = $this->Mdl_marital_status->insertUpdateRecord($maritalStatusArray, 'marital_status_id', 'tbl_marital_status', 1);

			if (isset($maritalStatusId) && $maritalStatusId != '') {
				if ($maritalStatusData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'), MARITALSTATUS);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), MARITALSTATUS);
				}
			} else {
				if ($maritalStatusData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), MARITALSTATUS);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), MARITALSTATUS);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$maritalStatusId   = $this->input->post('deleteId',TRUE);
		$maritalStatusData = $this->Mdl_marital_status->deleteRecord($maritalStatusId);

		if ($maritalStatusData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),MARITALSTATUS);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),MARITALSTATUS);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$maritalStatusId  = $this->input->post('maritalStatusId');
		$data['get_data'] = $this->Mdl_marital_status->getData($maritalStatusId);
		echo json_encode($data['get_data']);
	}


	public function getMaritalStatusDD(){
		$filterParameter       = $this->input->post('filter_param');
		$maritalStatusIdActive = $this->input->post('maritalStatusIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_marital_status->getMaritalStatusDD($filterParameter,$page,$maritalStatusIdActive);
	}

}
