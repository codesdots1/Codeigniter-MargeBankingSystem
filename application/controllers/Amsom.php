<?php


class Amsom extends DT_CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_amsom");
		$this->lang->load('amsom');
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

		$data['v_amsomModal'] = $this->load->view('amsom/v_amsomModal', '', TRUE);
		$this->dt_ci_template->load("default", "amsom/v_amsom", $data);
	}

	public function getAmsomListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("ta.amsom_id,ta.amsom_name");
		$this->datatables->from("tbl_amsom as ta");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$amsomId   = $this->input->post('amsom_id');
		$amosmName = $this->input->post('amsom_name');

		if (isset($amsomId) && $amsomId == '') {
			$this->form_validation->set_rules('amsom_name', $this->lang->line('amsom_name'), 'required|is_unique[tbl_amsom.amsom_name]');
		} else {
			$this->form_validation->set_rules('amsom_name', $this->lang->line('amsom_name'), 'required|edit_unique[tbl_amsom.amsom_name.' . $amsomId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$amsomArray =	array(
				'amsom_id'	 => $amsomId,
				'amsom_name'  => $amosmName,
			);

			$amosmData = $this->Mdl_amsom->insertUpdateRecord($amsomArray, 'amsom_id', 'tbl_amsom', 1);

			if (isset($amsomId) && $amsomId != '') {
				if ($amosmData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'),AMSOM);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), AMSOM);
				}
			} else {
				if ($amosmData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), AMSOM);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), AMSOM);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$amsomId   = $this->input->post('deleteId',TRUE);
		$amosmData = $this->Mdl_amsom->deleteRecord($amsomId);

		if ($amosmData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),AMSOM);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),AMSOM);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData()
	{
		$amsomId 	  = $this->input->post('amsomId');
		$data['get_data'] = $this->Mdl_amsom->getData($amsomId);
		echo json_encode($data['get_data']);
	}


	public function getAmsomDD()
	{
		$filterParameter    = $this->input->post('filter_param');
		$amsomIdActive = $this->input->post('amsomIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_amsom->getAmsomDD($filterParameter,$page,$amsomIdActive);
	}

}
