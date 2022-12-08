<?php


class Customer extends DT_CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model(array("Mdl_customer"));
		$this->lang->load('customer');
	}

	public function index()
	{
		$data['extra_js'] = array(
			"js/plugins/tables/datatables/datatables.min.js",
			"js/plugins/notifications/sweet_alert.min.js",
			"js/plugins/forms/selects/select2.min.js",
			"js/plugins/forms/styling/uniform.min.js",
			"js/pages/form_layouts.js",
			"js/plugins/forms/jquery.form.min.js",
			"js/plugins/ui/moment/moment.min.js",
			"js/plugins/pickers/anytime.min.js",
			//"js/pages/picker_date.js",
			"js/plugins/ui/ripple.min.js",
		);
		$this->dt_ci_template->load("default", "customer/v_customer", $data);
	}

	public function getCustomerListing(){
		$this->load->library('datatables');
		$this->datatables->select("");
		$this->datatables->from("tbl_customer as tc");
		echo $this->datatables->generate();
	}

	public function manage($customerId = '')
	{
		$data['extra_js'] = array(
			"js/plugins/tables/datatables/datatables.min.js",
			"js/plugins/forms/styling/uniform.min.js",
			"js/plugins/notifications/sweet_alert.min.js",
			"js/plugins/forms/jquery.form.min.js",
			"js/plugins/media/fancybox.min.js",
			"js/additional-methods.min.js",
			"js/plugins/forms/selects/select2.min.js",
			"js/core/libraries/jquery_ui/widgets.min.js",
			"/js/plugins/pickers/anytime.min.js",
			"/js/maps/jquery.geocomplete.js",
		);
		$select2 = array(
			'monk' => true
		);
		if($customerId != '') {
			$data['getCustomerData']         = $this->Mdl_customer->getCustomerData($customerId);

		}
		$data['select2']                 = $this->load->view("commonMaster/v_select2",$select2,true);
		$this->dt_ci_template->load("default", "customer/v_customer_manage",$data);
	}

	public function save()
	{
		$this->db->trans_begin();
		$monkLocationId         = $this->input->post('monk_location_id',TRUE);
		$monkId                 = $this->input->post('monk_id', TRUE);
		$locationName           = $this->input->post('location_name', TRUE);
		$address                = $this->input->post('address', TRUE);
		$contactPerson          = $this->input->post('contact_person', TRUE);
		$contactPersonMobile    = $this->input->post('contact_person_mobile', TRUE);
		$usrId                  = $this->session->userdata['user_id'];


		if(isset($monkLocationId) && $monkLocationId == ''){
			$this->form_validation->set_rules('contact_person_mobile', $this->lang->line('contact_person_mobile'), 'required|is_unique[tbl_monk_location.contact_person_mobile]');
		} else{
			$this->form_validation->set_rules('contact_person_mobile', $this->lang->line('contact_person_mobile'), 'required|edit_unique[tbl_monk_location.contact_person_mobile.'.$monkLocationId.']');
		}

		$this->form_validation->set_rules('google_address', $this->lang->line('google_address'), 'required');
		$this->form_validation->set_rules('latitude', $this->lang->line('latitude'), 'required|numeric');
		$this->form_validation->set_rules('longitude', $this->lang->line('longitude'), 'required|numeric');

		$this->form_validation->set_message('required', '%s is required');
		$this->form_validation->set_message('numeric', '%s Please Enter Only Number');
		$this->form_validation->set_message('is_unique', 'This %s Already Exists');
		$this->form_validation->set_message('edit_unique', 'This %s Already Exists');


		$monkLocationData  = array(
			'monk_id'           => $monkId,
			'monk_location_id'  => $monkLocationId,
			'location_name'     => $locationName
		);

		$isExist = $this->Mdl_monk_location->checkExistMonkLocation($monkLocationData);
		foreach ($isExist as $isExistKey => $isExistValue){
			if($isExistValue != 0){
				$response['success'] = false;
				$response['msg']     = strip_tags('Duplicate MonkLocation');
				echo json_encode($response);
				die();
			}
		}


		if ($this->form_validation->run() == false) {
			$response['success'] = false;
			$response['msg'] = strip_tags(validation_errors(""));
			echo json_encode($response);
			exit;
		} else {
			$monkLocationArray = array(
				'monk_location_id'             => $monkLocationId,
				'monk_id'                      => $monkId,
				'location_name'                => $locationName,
				'address'                      => $address,
				'google_address'               => $this->input->post('google_address', TRUE),
				'latitude'                     => $this->input->post('latitude', TRUE),
				'longitude'                    => $this->input->post('longitude', TRUE),
				'contact_person'               => $contactPerson,
				'contact_person_mobile'        => $contactPersonMobile,
				'created_at'                   => date('Y:m:d  h:m:s'),
				'created_by'                   => $usrId,
				'updated_at'                   => date('Y:m:d  h:m:s'),
				'updated_by'                   => $usrId
			);

			$monkLocationData = $this->Mdl_monk_location->insertUpdateRecord($monkLocationArray,'monk_location_id','tbl_monk_location',1);

			if (isset($monkLocationId) && $monkLocationId != '') {
				if ($monkLocationData['success']) {
					$this->db->trans_commit();
					$response['success']    = true;
					$response['msg']        = sprintf($this->lang->line('update_record'),MONKLOCATION);
				} else {
					$this->db->trans_rollback();
					$response['success']    = false;
					$response['msg']        = sprintf($this->lang->line('update_record_error'),MONKLOCATION);
				}
			} else {
				if ($monkLocationData['success']) {
					$this->db->trans_commit();
					$response['success']  = true;
					$response['msg']      = sprintf($this->lang->line('create_record'),MONKLOCATION);
				} else {
					$this->db->trans_rollback();
					$response['success']  = false;
					$response['msg']      = sprintf($this->lang->line('create_record_error'),MONKLOCATION);
				}
			}
			echo json_encode($response);
		}
	}

	public function delete()
	{
		$monkLocationId = $this->input->post('deleteId',TRUE);
		//delete monk location
		$monkLocationData = $this->Mdl_monk_location->deleteRecord($monkLocationId);

		if ($monkLocationData) {
			$response['success'] = true;
			$response['msg']     = sprintf($this->lang->line('delete_monk_location_record'),MONKLOCATION);
		} else {
			$response['success'] = false;
			$response['msg'] = sprintf($this->lang->line('delete_monk_location_error'),MONKLOCATION);
		}
		echo json_encode($response);
	}
}
