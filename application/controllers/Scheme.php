<?php


class Scheme extends DT_CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_scheme");
		$this->lang->load('scheme');
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

		$data['v_schemeModal'] = $this->load->view('scheme/v_schemeModal', '', TRUE);
		$this->dt_ci_template->load("default", "scheme/v_scheme", $data);
	}

	public function getSchemeListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("ts.scheme_id,ts.scheme_name,ts.scheme_code");
		$this->datatables->from("tbl_scheme as ts");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$schemeId   = $this->input->post('scheme_id');
		$schemeName = $this->input->post('scheme_name');
		$schemeCode = $this->input->post('scheme_code');

		if (isset($schemeId) && $schemeId == '') {
			$this->form_validation->set_rules('scheme_name', $this->lang->line('scheme_name'), 'required|is_unique[tbl_scheme.scheme_name]');
		} else {
			$this->form_validation->set_rules('scheme_name', $this->lang->line('scheme_name'), 'required|edit_unique[tbl_scheme.scheme_name.' . $schemeId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$schemeArray =	array(
				'scheme_id'	   => $schemeId,
				'scheme_name'  => $schemeName,
				'scheme_code'  => $schemeCode,
			);
			$schemeData = $this->Mdl_scheme->insertUpdateRecord($schemeArray, 'scheme_id', 'tbl_scheme', 1);

			if (isset($schemeId) && $schemeId != '') {
				if ($schemeData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'),SCHEME );
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), SCHEME);
				}
			} else {
				if ($schemeData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), SCHEME);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), SCHEME);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$schemeId   = $this->input->post('deleteId',TRUE);
		$schemeData = $this->Mdl_scheme->deleteRecord($schemeId);

		if ($schemeData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),SCHEME);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),SCHEME);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$schemeId 	  = $this->input->post('schemeId');
		$data['get_data'] = $this->Mdl_scheme->getData($schemeId);
		echo json_encode($data['get_data']);
	}


	public function getSchemeDD(){
		$filterParameter = $this->input->post('filter_param');
		$schemeIdActive = $this->input->post('schemeIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_scheme->getSchemeDD($filterParameter,$page,$schemeIdActive);
	}

}
