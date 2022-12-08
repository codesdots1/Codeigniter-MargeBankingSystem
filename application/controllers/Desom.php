<?php


class Desom extends DT_CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_desom");
		$this->lang->load('desom');
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

		$data['v_desomModal'] = $this->load->view('desom/v_desomModal', '', TRUE);
		$this->dt_ci_template->load("default", "desom/v_desom", $data);
	}

	public function getDesomListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("td.desom_id,td.desom_name");
		$this->datatables->from("tbl_desom as td");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$desomId   = $this->input->post('desom_id');
		$desomName = $this->input->post('desom_name');

		if (isset($desomId) && $desomId == '') {
			$this->form_validation->set_rules('desom_name', $this->lang->line('desom_name'), 'required|is_unique[tbl_desom.desom_name]');
		} else {
			$this->form_validation->set_rules('desom_name', $this->lang->line('desom_name'), 'required|edit_unique[tbl_desom.desom_name.' . $desomId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$desomArray =	array(
				'desom_id'	 => $desomId,
				'desom_name'  => $desomName,
			);

			$desomData = $this->Mdl_desom->insertUpdateRecord($desomArray, 'desom_id', 'tbl_desom', 1);

			if (isset($desomId) && $desomId != '') {
				if ($desomData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'),DESOM);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), DESOM);
				}
			} else {
				if ($desomData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), DESOM);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), DESOM);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$desomId   = $this->input->post('deleteId',TRUE);
		$desomData = $this->Mdl_desom->deleteRecord($desomId);

		if ($desomData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),DESOM);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),DESOM);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData()
	{
		$desomId 	  = $this->input->post('desomId');
		$data['get_data'] = $this->Mdl_desom->getData($desomId);
		echo json_encode($data['get_data']);
	}


	public function getDesomDD()
	{
		$filterParameter    = $this->input->post('filter_param');
		$desomIdActive = $this->input->post('desomIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_desom->getDesomDD($filterParameter,$page,$desomIdActive);
	}

}
