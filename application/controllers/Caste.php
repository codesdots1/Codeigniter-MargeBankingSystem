<?php


class Caste extends DT_CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model(array("Mdl_caste","Mdl_religion"));
		$this->lang->load('caste');
	}

	//Index page
	public function index()
	{
		$data['extra_js'] = array(
			"js/plugins/tables/datatables/datatables.min.js",
			"js/plugins/notifications/sweet_alert.min.js",
			"js/plugins/forms/styling/uniform.min.js",
			"js/plugins/forms/jquery.form.min.js",
			"js/plugins/forms/selects/select2.min.js"
		);

		$data['religionData'] = $this->Mdl_religion->getData();
		$data['v_casteModal'] = $this->load->view('caste/v_casteModal', $data, TRUE);
		$this->dt_ci_template->load("default", "caste/v_caste", $data);
	}

	// ajax call to the data listing
	public function getCasteListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("tc.caste_id,tc.caste_name,tc.religion_id,tr.religion_name");
		$this->datatables->from("tbl_caste as tc");
		$this->datatables->join("tbl_religion as tr",'tr.religion_id = tc.religion_id', 'left');
		echo $this->datatables->generate();
	}

	//insert and update state
	public function save()
	{
		$casteId 	 = $this->input->post('caste_id');
		$religionId  = $this->input->post('religion_id');
		$casteName   = $this->input->post('caste_name');

		if (isset($casteId) && $casteId == '') {
			$this->form_validation->set_rules('caste_name', $this->lang->line('caste_name'), 'required');
		} else {
			$this->form_validation->set_rules('caste_name', $this->lang->line('caste_name'), 'required');
		}

		$this->form_validation->set_message('required', '%s is required');

		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$isExist = $this->Mdl_caste->checkExistCaste($casteId, $religionId ,$casteName);
			if($isExist == 1){
				$response['success'] = false;
				$response['msg']         = strip_tags('Duplicate Caste');
				echo json_encode($response);
				die();
			}

			$casteArray = array(
				'caste_id'       => $casteId,
				'religion_id'    => $this->input->post('religion_id',TRUE),
				'caste_name'     => $this->input->post('caste_name',TRUE),
			);

			$casteData = $this->Mdl_caste->insertUpdateRecord($casteArray,'caste_id','tbl_caste');

			if (isset($casteId) && $casteId != '') {
				if ($casteData['success']) {
					$response['success']      = true;
					$response['msg']          = sprintf($this->lang->line('update_record'),CASTE);
				} else {
					$response['success']      = false;
					$response['msg']          = sprintf($this->lang->line('update_record_error'),CASTE);
				}
			} else {
				if ($casteData['success']) {
					$response['success']  = true;
					$response['msg']      = sprintf($this->lang->line('create_record'),CASTE);
				} else {
					$response['success']  = false;
					$response['msg']      = sprintf($this->lang->line('create_record_error'),CASTE);
				}
			}

			echo json_encode($response);
		}
	}


	public function delete()
	{
		$casteId   = $this->input->post('deleteId',TRUE);
		$casteData = $this->Mdl_caste->deleteRecord($casteId);

		if ($casteData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),CASTE);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),CASTE);
		}
		echo json_encode($response);
	}

	//edit time get the state data
	public function getData()
	{
		$casteId = $this->input->post('casteId');
		$data['get_data'] = $this->Mdl_caste->getData($casteId);
		echo json_encode($data['get_data']);
	}


	public function getCasteDD()
	{
		$filterParameter = $this->input->post('filter_param');
		$religionId = $this->input->post('religionId');
		$casteIdActive = $this->input->post('casteIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_caste->getCasteDD($filterParameter,$page,$religionId,$casteIdActive);
	}
}
