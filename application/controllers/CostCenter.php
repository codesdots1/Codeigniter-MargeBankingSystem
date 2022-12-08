<?php


class CostCenter extends DT_CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_cost_center");
		$this->lang->load('cost_center');
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

		$data['v_costCenterModal'] = $this->load->view('costCenter/v_costCenterModal', '', TRUE);
		$this->dt_ci_template->load("default", "costCenter/v_cost_center", $data);
	}

	public function getCostCenterListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("tcc.cost_center_id,tcc.cost_center_name");
		$this->datatables->from("tbl_cost_center as tcc");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$costCenterId   = $this->input->post('cost_center_id');
		$costCenterName = $this->input->post('cost_center_name');

		if (isset($costCenterId) && $costCenterId == '') {
			$this->form_validation->set_rules('cost_center_name', $this->lang->line('cost_center_name'), 'required|is_unique[tbl_cost_center.cost_center_name]');
		} else {
			$this->form_validation->set_rules('cost_center_name', $this->lang->line('cost_center_name'), 'required|edit_unique[tbl_cost_center.cost_center_name.' . $costCenterId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$costCenterArray =	array(
				'cost_center_id'	=> $costCenterId,
				'cost_center_name'  => $costCenterName,
			);

			$costCenterData = $this->Mdl_cost_center->insertUpdateRecord($costCenterArray, 'cost_center_id', 'tbl_cost_center', 1);

			if (isset($costCenterId) && $costCenterId != '') {
				if ($costCenterData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'),COST_CENTER);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), COST_CENTER);
				}
			} else {
				if ($costCenterData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), COST_CENTER);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), COST_CENTER);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$costCenterId   = $this->input->post('deleteId',TRUE);
		$costCenterData = $this->Mdl_cost_center->deleteRecord($costCenterId);

		if ($costCenterData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),COST_CENTER);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),COST_CENTER);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$costCenterId 	  = $this->input->post('costCenterId');
		$data['get_data'] = $this->Mdl_cost_center->getData($costCenterId);
		echo json_encode($data['get_data']);
	}


	public function getCostCenterDD(){
		$filterParameter    = $this->input->post('filter_param');
		$costCenterIdActive = $this->input->post('costCenterIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_cost_center->getCostCenterDD($filterParameter,$page,$costCenterIdActive);
	}

}
