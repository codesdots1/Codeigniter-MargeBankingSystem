<?php


class Occupation extends DT_CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_occupation");
		$this->lang->load('occupation');
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

		$data['v_occupationModal'] = $this->load->view('occupation/v_occupationModal', '', TRUE);
		$this->dt_ci_template->load("default", "occupation/v_occupation", $data);
	}

	public function getOccupationListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("to.occupation_id,to.occupation_name");
		$this->datatables->from("tbl_occupation as to");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$occupationId   = $this->input->post('occupation_id');
		$occupationName = $this->input->post('occupation_name');

		if (isset($occupationId) && $occupationId == '') {
			$this->form_validation->set_rules('occupation_name', $this->lang->line('occupation_name'), 'required|is_unique[tbl_occupation.occupation_name]');
		} else {
			$this->form_validation->set_rules('occupation_name', $this->lang->line('occupation_name'), 'required|edit_unique[tbl_occupation.occupation_name.' . $occupationId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$occupationArray =	array(
				'occupation_id'	  => $occupationId,
				'occupation_name' => $occupationName,
			);
			$occupationData = $this->Mdl_occupation->insertUpdateRecord($occupationArray, 'occupation_id', 'tbl_occupation', 1);

			if (isset($occupationId) && $occupationId != '') {
				if ($occupationData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'), OCCUPATION);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), OCCUPATION);
				}
			} else {
				if ($occupationData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), OCCUPATION);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), OCCUPATION);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$occupationId   = $this->input->post('deleteId',TRUE);
		$occupationData = $this->Mdl_occupation->deleteRecord($occupationId);

		if ($occupationData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),OCCUPATION);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),OCCUPATION);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$occupationId 	  = $this->input->post('occupationId');
		$data['get_data'] = $this->Mdl_occupation->getData($occupationId);
		echo json_encode($data['get_data']);
	}


	public function getOccupationDD(){
		$filterParameter = $this->input->post('filter_param');
		$occupationIdActive = $this->input->post('occupationIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_occupation->getOccupationDD($filterParameter,$page,$occupationIdActive);
	}

}
