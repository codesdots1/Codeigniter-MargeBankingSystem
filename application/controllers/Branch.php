<?php


class Branch extends DT_CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_branch");
		$this->lang->load('branch');
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

		$data['v_branchModal'] = $this->load->view('branch/v_branchModal', '', TRUE);
		$this->dt_ci_template->load("default", "branch/v_branch", $data);
	}

	public function getBranchListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("tb.branch_id,tb.branch_name,tb.branch_code");
		$this->datatables->from("tbl_branch as tb");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$branchId   = $this->input->post('branch_id');
		$branchName = $this->input->post('branch_name');
		$branchCode = $this->input->post('branch_code');

		if (isset($branchId) && $branchId == '') {
			$this->form_validation->set_rules('branch_name', $this->lang->line('branch_name'), 'required|is_unique[tbl_branch.branch_name]');
		} else {
			$this->form_validation->set_rules('branch_name', $this->lang->line('branch_name'), 'required|edit_unique[tbl_branch.branch_name.' . $branchId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$branchArray =	array(
				'branch_id'	   => $branchId,
				'branch_name'  => $branchName,
				'branch_code'  => $branchCode,
			);
			$branchData = $this->Mdl_branch->insertUpdateRecord($branchArray, 'branch_id', 'tbl_branch', 1);

			if (isset($branchId) && $branchId != '') {
				if ($branchData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'), BRANCH);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), BRANCH);
				}
			} else {
				if ($branchData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), BRANCH);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), BRANCH);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$branchId   = $this->input->post('deleteId',TRUE);
		$branchData = $this->Mdl_branch->deleteRecord($branchId);

		if ($branchData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),BRANCH);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),BRANCH);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$branchId 	  = $this->input->post('branchId');
		$data['get_data'] = $this->Mdl_branch->getData($branchId);
		echo json_encode($data['get_data']);
	}


	public function getBranchDD(){
		$filterParameter = $this->input->post('filter_param');
		$branchIdActive = $this->input->post('branchIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_branch->getBranchDD($filterParameter,$page,$branchIdActive);
	}

}
