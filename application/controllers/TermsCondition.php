<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class TermsCondition extends DT_CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model("Mdl_terms_condition");
        $this->lang->load('terms_condition');
    }

    //Index page
    public function index()
    {
        $data['extra_js'] = array(
            "js/plugins/tables/datatables/datatables.min.js",
            "js/plugins/notifications/sweet_alert.min.js",
            "js/plugins/forms/styling/uniform.min.js",
            "js/plugins/forms/jquery.form.min.js"
        );

        $this->dt_ci_template->load("default", "commonMaster/v_terms_condition", $data);
    }

    // ajax call to the data listing
    public function getTermsConditionListing()
    {
        $this->load->library('datatables');
        $this->datatables->select("terms_condition_id,title,is_active");
        $this->datatables->from("tbl_terms_conditions as terms");
        echo $this->datatables->generate();
    }

    //change status
    public function changeStatus()
    {
        $termsConditionId =  $this->input->post('termsConditionId', TRUE);
        $status           =  $this->input->post('status', TRUE);

        if ($status == 0) {
            $status = 1;
        } else {
            $status = 0;
        }

        $return = $this->Mdl_terms_condition->statusChange($termsConditionId,$status,'terms_condition_id','tbl_terms_conditions');
        if ($return == 1) {
            $response['success'] = true;
            $response['msg']     = sprintf($this->lang->line('status_change'),TERMS_CONDITION);
        } else {
            $response['success'] = false;
            $response['msg']     = sprintf($this->lang->line('status_change_error'),TERMS_CONDITION);
        }
        echo json_encode($response);
    }



    //insert and update function
    public function manage($termsConditionId = '') // change here manage
    {
        $data['extra_js'] = array(
            "../ckeditor/ckeditor.js",
            "js/plugins/tables/datatables/datatables.min.js",
            "js/plugins/notifications/sweet_alert.min.js",
            "js/plugins/forms/jquery.form.min.js",
        );

            if($termsConditionId != ''){
                $data['getTermsConditionData'] = $this->Mdl_terms_condition->getTermsConditionData($termsConditionId);
            }

            $this->dt_ci_template->load("default", "commonMaster/v_terms_condition_manage", $data);
    }


    public function titleExist()
    {
        $termsConditionId   = $this->input->post("terms_condition_id",TRUE);

        if (isset($termsConditionId) && $termsConditionId == '') {
            $this->form_validation->set_rules('title', $this->lang->line('title'), 'required|is_unique[tbl_terms_conditions.title]');
        } else {
            $this->form_validation->set_rules('title', $this->lang->line('title'), 'required|edit_unique[tbl_terms_conditions.title.' . $termsConditionId . ']');
        }

        if ($this->form_validation->run() == false) {
            echo "false";
            die();
        } else {
            echo "true";
            die();
        }


    }

    // Save function here
    public function save()
    {
        $termsConditionId = $this->input->post('terms_condition_id');

        if (isset($termsConditionId) && $termsConditionId == '') {
            $this->form_validation->set_rules('title', $this->lang->line('title'), 'required|is_unique[tbl_terms_conditions.title]');
        } else {
            $this->form_validation->set_rules('title', $this->lang->line('title'), 'required|edit_unique[tbl_terms_conditions.title.' . $termsConditionId . ']');
        }

        $this->form_validation->set_rules('description', $this->lang->line('description'), 'required');

        $this->form_validation->set_message('required', '%s is required');
        $this->form_validation->set_message('is_unique', 'This %s already exists');
        $this->form_validation->set_message('edit_unique', 'This %s already exists');


        if ($this->form_validation->run() == false) {
            $response['success'] = false;
            $response['msg']     = strip_tags(validation_errors(""));
            echo json_encode($response);

        } else {
            $isActive = $this->input->post('is_active', true);
            $termsConditionArray = array(
                'terms_condition_id'      => $termsConditionId,
                'title'                   => $this->input->post('title', TRUE),
                'description'             => $this->input->post('description', TRUE),
                'is_active'               => isset($isActive) ? 1 : 0,
            );

            $termsConditionData = $this->Mdl_terms_condition->insertUpdateRecord($termsConditionArray,'terms_condition_id','tbl_terms_conditions');

            if (isset($termsConditionId) && $termsConditionId != '') {
                if ($termsConditionData['success']) {
                    $response['success']    = true;
                    $response['msg']        = sprintf($this->lang->line('update_record'),TERMS_CONDITION);
                } else {
                    $response['success']    = false;
                    $response['msg']        = sprintf($this->lang->line('update_record_error'),TERMS_CONDITION);
                }
            } else {
                if ($termsConditionData['success']) {
                    $response['success']  = true;
                    $response['msg']      = sprintf($this->lang->line('create_record'),TERMS_CONDITION);

                } else {
                    $response['success']  = false;
                    $response['msg']      = sprintf($this->lang->line('create_record_error'),TERMS_CONDITION);
                }
            }
            echo json_encode($response);
        }
    }



    public function delete()
    {
        $termsConditionId = $this->input->post('deleteId',TRUE);

        if( is_reference_in_table('terms_condition_id', 'tbl_quotation', $termsConditionId)){
            $response['success'] = false;
            $response['msg'] = $this->lang->line('delete_record_dependency');
            echo json_encode($response);
            exit;
        }
        //delete  terms condition
        $termsConditionData = $this->Mdl_terms_condition->deleteRecord($termsConditionId);
        if ($termsConditionData) {
            $response['success'] = true;
            $response['msg']     = sprintf($this->lang->line('delete_record'),TERMS_CONDITION);
        } else {
            $response['success'] = false;
            $response['msg'] = sprintf($this->lang->line('error_delete_record'),TERMS_CONDITION);
        }

        echo json_encode($response);
    }
}

?>