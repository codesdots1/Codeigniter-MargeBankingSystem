<?php


class Section extends DT_CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Mdl_section");
		$this->lang->load('section');
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

		$data['v_sectionModal'] = $this->load->view('section/v_sectionModal', '', TRUE);
		$this->dt_ci_template->load("default", "section/v_section", $data);
	}

	public function getSectionListing()
	{
		$this->load->library('datatables');
		$this->datatables->select("ts.section_id,ts.section_name");
		$this->datatables->from("tbl_section as ts");
		echo $this->datatables->generate();
	}

	public function save()
	{
		$sectionId   = $this->input->post('section_id');
		$sectionName = $this->input->post('section_name');

		if (isset($sectionId) && $sectionId == '') {
			$this->form_validation->set_rules('section_name', $this->lang->line('section_name'), 'required|is_unique[tbl_section.section_name]');
		} else {
			$this->form_validation->set_rules('section_name', $this->lang->line('section_name'), 'required|edit_unique[tbl_section.section_name.' . $sectionId . ']');
		}

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('is_unique', 'This %s already exists');
		$this->form_validation->set_message('edit_unique', 'This %s already exists');


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg']     = strip_tags(validation_errors(""));
			echo json_encode($response);

		} else {
			$sectionArray =	array(
				'section_id'	=> $sectionId,
				'section_name'  => $sectionName,
			);
			$sectionData = $this->Mdl_section->insertUpdateRecord($sectionArray, 'section_id', 'tbl_section', 1);

			if (isset($sectionId) && $sectionId != '') {
				if ($sectionData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('update_record'), SECTION);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('update_record_error'), SECTION);
				}
			} else {
				if ($sectionData['success']) {
					$response['success'] = true;
					$response['msg'] = sprintf($this->lang->line('create_record'), SECTION);
				} else {
					$response['success'] = false;
					$response['msg'] = sprintf($this->lang->line('create_record_error'), SECTION);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$sectionId   = $this->input->post('deleteId',TRUE);
		$sectionData = $this->Mdl_section->deleteRecord($sectionId);

		if ($sectionData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_record'),SECTION);
		} else {
			$response['success'] = false;
			$response['msg']     = sprintf($this->lang->line('error_delete_record'),SECTION);
		}
		echo json_encode($response);
	}



	//edit time get the religion data
	public function getData(){
		$sectionId 	  = $this->input->post('sectionId');
		$data['get_data'] = $this->Mdl_section->getData($sectionId);
		echo json_encode($data['get_data']);
	}


	public function getSectionDD(){
		$filterParameter = $this->input->post('filter_param');
		$sectionIdActive = $this->input->post('sectionIdActive');
		$page = $this->input->post('page');
		echo $this->Mdl_section->getSectionDD($filterParameter,$page,$sectionIdActive);
	}

}
