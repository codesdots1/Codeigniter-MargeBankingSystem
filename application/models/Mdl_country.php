<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Mdl_country extends DT_CI_Model {
    public function __construct()
    {
        parent::__construct();
        // Your own constructor code

    }


    public function deleteRecord($countryId)
    {
        $tables = array('tbl_country');
        $this->db->where_in('country_id',$countryId);
        $this->db->delete($tables);

        $ids = is_array($countryId) ? implode(',',$countryId) : $countryId;

        if ($this->db->affected_rows()) {
            logActivity('Country Deleted [CountryID: ' . $ids . ']',$this->data['userId'],'Country');
            return true;
        }
        return false;
    }

    public function getData($countryId = '')
    {
        if($countryId != '') {
            $this->db->where('country_id', $countryId);
        }
        $data = $this->db->get("tbl_country");
        $query = $data->result_array();
        return $query;
    }

    
    function getCountryDD($filterParameter = '',$page = 1,$countryIdActive ,$start = 0, $limit = 10)
    {
        if($page != 1){
            $start = ($page * $limit) - $limit;
        }

        $this->db->start_cache();
        $this->db->select('country_id as id,country_name as text');
        $this->db->from('tbl_country');
        if ($filterParameter != '') {
            $this->db->like('country_name', $filterParameter, 'both');
        }
        $this->db->where('is_active',1);
        $this->db->or_where_in('country_id',$countryIdActive);
        $this->db->stop_cache();
        $totalRows = $this->db->count_all_results();

        $this->db->limit($limit, $start);

        $query = $this->db->get();

        $result['result'] = $query->result_array();
        $result['totalRows'] = $totalRows;
        $result['page'] = $page;
        $this->db->flush_cache();

        return json_encode($result);
    }

}
?>