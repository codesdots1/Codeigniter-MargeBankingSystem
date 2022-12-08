<?php
/**
 * Created by PhpStorm.
 * User: dt-user09
 * Date: 2/28/2019
 * Time: 11:06 AM
 */

class SamajWebserviceLog extends DT_CI_Controller{

    public function __construct(){
        parent::__construct();
        $this->load->model("Mdl_samaj_webservice_log");
    }

    public function index(){
        $data['extra_js'] = array(
            "js/plugins/tables/datatables/datatables.min.js",
        );
        $this->dt_ci_template->load("default", "webservice_log/v_samaj_webservice", $data);
    }

    public function getTableListing(){
        $this->load->library('datatables');
        $this->datatables->select("log.id,log.uri,SUBSTRING_INDEX(log.uri, '/', -1)as uriMethod,DATE_FORMAT(FROM_UNIXTIME(log.time), '%d-%m-%Y %H:%i:%s %p') AS time,DATE_FORMAT(FROM_UNIXTIME(log.responsetime), '%d-%m-%Y %H:%i:%s %p') AS responsetime,log.response_code");
        $this->datatables->from("tbl_logs as log");
        echo $this->datatables->generate();

    }

    public function getSamajResponseRequest(){
        $logId                  = $this->input->post('logId');
        $data['logId']          = $logId;
        $samajResquestResponse = $this->Mdl_samaj_webservice_log->getReqResData($logId);
        $data['logData']        = $samajResquestResponse[0];
        $output                 = $this->load->view("webservice_log/v_samaj_request_response", $data, true);
        echo $output;
    }

}
