<?php
/**
 * Created by PhpStorm.
 * User: dt-user09
 * Date: 2/28/2019
 * Time: 11:07 AM
 */

class Mdl_samaj_webservice_log extends CI_Model{

    public function __construct(){
        parent::__construct();
    }

    public  function getReqResData($logId){
        $this->db->select('id,params,response');
        $this->db->from('tbl_logs');
        $this->db->where('id',$logId);
        $query=$this->db->get();
        $result=$query->result_array();
        return $result;

    }

}
