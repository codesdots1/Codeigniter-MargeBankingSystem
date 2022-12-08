<?php


class Religion extends DT_CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_religion");
		$this->lang->load('religion');
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

		$data['v_religionModal'] = $this->load->view('religion/v_religionModal', '', TRUE);
		$this->dt_ci_template->load("default", "religion/v_religion", $data);
	}

	public function getReligionListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("tr.religion_id,tr.religion_name");
		$this->datatables->from("tbl_religion as tr");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$religionId   = $this->input->post('religion_id');
		$religionName = $this->input->post('religion_name');

		if (isset($religionId) && $religionId == '') {
			$this->form_validation->set_rules('religion_name', $this->lang->line('religion_name'), 'required|is_unique[tbl_religion.religion_name]');
		} else {
			$this->form_validation->set_rules('religion_name', $this->lang->line('religion_name'), 'required|edit_unique[tbl_religion.religion_name.' . $religionId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$religionArray =	array(
				'religion_id'	 => $religionId,
				'religion_name'  => $religionName,
			);
			$religionData = $this->Mdl_religion->insertUpdateRecord($religionArray, 'religion_id', 'tbl_religion', 1);

			if (isset($religionId) && $religionId != '') {
				if ($religionData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'), RELIGION);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), RELIGION);
				}
			} else {
				if ($religionData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), RELIGION);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), RELIGION);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$religionId = $this->input->post('deleteId',TRUE);

//		if( is_reference_in_table('month_work_id', 'tbl_month_work_day', $monthWorkId)) {
//			$response['success'] = false;
//			$response['msg'] = $this->lang->line('delete_record_dependency');
//			echo json_encode($response);
//			exit;
//		}

		$religionData = $this->Mdl_religion->deleteRecord($religionId);

		if ($religionData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),RELIGION);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),RELIGION);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$religionId 	  = $this->input->post('religionId');
		$data['get_data'] = $this->Mdl_religion->getData($religionId);
		echo json_encode($data['get_data']);
	}


	public function getReligionDD(){
		$filterParameter = $this->input->post('filter_param');
		$religionIdActive = $this->input->post('religionIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_religion->getReligionDD($filterParameter,$page,$religionIdActive);
	}
}
