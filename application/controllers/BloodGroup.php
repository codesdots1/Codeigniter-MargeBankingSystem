<?php


class BloodGroup extends DT_CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_blood_group");
		$this->lang->load('blood_group');
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

		$data['v_blood_groupModal'] = $this->load->view('bloodGroup/v_blood_groupModal', '', TRUE);
		$this->dt_ci_template->load("default", "bloodGroup/v_blood_group", $data);
	}

	public function getBloodGroupListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("tgd.blood_group_id,tgd.blood_group_name");
		$this->datatables->from("tbl_blood_group as tgd");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$bloodGroupId   = $this->input->post('blood_group_id');
		$bloodGroupName = $this->input->post('blood_group_name');

		if (isset($bloodGroupId) && $bloodGroupId == '') {
			$this->form_validation->set_rules('blood_group_name', $this->lang->line('blood_group_name'), 'required|is_unique[tbl_blood_group.blood_group_name]');
		} else {
			$this->form_validation->set_rules('blood_group_name', $this->lang->line('blood_group_name'), 'required|edit_unique[tbl_blood_group.blood_group_name.' . $bloodGroupId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$bloodGroupArray =	array(
				'blood_group_id'	 => $bloodGroupId,
				'blood_group_name'   => $bloodGroupName,
			);
			$bloodGroupData = $this->Mdl_blood_group->insertUpdateRecord($bloodGroupArray, 'blood_group_id', 'tbl_blood_group', 1);

			if (isset($bloodGroupId) && $bloodGroupId != '') {
				if ($bloodGroupData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'), BLOODGROUP);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), BLOODGROUP);
				}
			} else {
				if ($bloodGroupData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), BLOODGROUP);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), BLOODGROUP);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$bloodGroupId   = $this->input->post('deleteId',TRUE);
		$bloodGroupData = $this->Mdl_blood_group->deleteRecord($bloodGroupId);

		if ($bloodGroupData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),BLOODGROUP);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),BLOODGROUP);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$bloodGroupId 	  = $this->input->post('bloodGroupId');
		$data['get_data'] = $this->Mdl_blood_group->getData($bloodGroupId);
		echo json_encode($data['get_data']);
	}


	public function getBloodGroupDD(){
		$filterParameter = $this->input->post('filter_param');
		$bloodGroupIdActive = $this->input->post('bloodGroupIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_blood_group->getBloodGroupDD($filterParameter,$page,$bloodGroupIdActive);
	}

}
