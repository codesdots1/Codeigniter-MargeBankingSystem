<div class="panel panel-flat">
    <div class="panel-heading">
        <h5 class="panel-title"><?= lang('opportunity_list') ?></h5>
        <div class="heading-elements">

            <a  href="<?= site_url('Opportunity/manage'); ?>" data-popup='custom-tooltip' title="<?= lang('add_opportunity') ?>" class="btn btn-xs border-slate-400 text-slate-400 btn-flat  btn-icon btn-rounded"><i class="icon-plus3"></i></a>
            <a type="button" data-popup='custom-tooltip'  title="<?= lang('delete_opportunity') ?>" class="btn btn-xs border-danger-400 text-danger-400 btn-flat btn-icon btn-rounded deleteRecord"><i class="icon-trash"></i></a>
        </div>
    </div>

    <div class="table-responsive">

        <table id="opportunityTable" class="table " cellspacing="0" width="100%">
            <thead>
            <tr>
                <th><input id="checkAll" type="checkbox"  class="dt-checkbox styled"></th>
                <th><?= lang('prefix') ?></th>
                <th><?= lang('series') ?></th>
                <th><?= lang('opportunity_from') ?></th>
                <th><?= lang('name') ?></th>
                <th><?= lang('action') ?></th>
            </tr>
            </thead>
        </table>
    </div>
</div>


<script>
    $(document).ready(function () {
        dt_DataTable = $('#opportunityTable').DataTable({
            dom: '<"datatable-header"fl><"datatable-scroll-wrap"t><"datatable-footer"ip>',
            language: {
                search: '<span>Filter:</span> _INPUT_',
                searchPlaceholder: 'Type to filter...',
                lengthMenu: '<span>Show:</span> _MENU_',
                paginate: {'first': 'First', 'last': 'Last', 'next': '&rarr;', 'previous': '&larr;'}
            },
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "<?= site_url('Opportunity/getOpportunityListing'); ?>",
                "type": "post",
                "data": function (d) {
                    return $.extend({}, d, {
                        "<?= $this->security->get_csrf_token_name() ?>": '<?= $this->security->get_csrf_hash() ?>'
                    });
                }
            },
            "iDisplayLength": "<?= PERPAGE_DISPLAY ?>",
            "order": [[1, "ASC"]],
            "stripeClasses": [ 'alpha-slate', 'even-row' ],
            "columns": [
                {"data": "opportunity_id"},
                {"data": "prefix"},
                {"data": "series"},
                {"data": "opportunity_from"},
                {"data": "name"},
                {
                    "data": "actions",
                    "render": function (data, type, row) {
                        var html = '';
                        var id = row['opportunity_id'];

                        html += "<a  href='<?= site_url('Opportunity/manage/'); ?>" + id + "' data-popup='custom-tooltip' onclick='EditRecord(" + id + ")' title='<?= lang('edit_opportunity') ?>' class='btn btn-xs border-slate-400 text-slate-400 btn-flat btn-icon btn-rounded'><i class='icon-pencil'></i></a>";
                        html += "&nbsp";
                        html += "<a href='javascript:void(0);' onclick='DeleteRecord(" + id + ")' data-popup='custom-tooltip' title='<?= lang('delete_opportunity') ?>'  class='btn btn-xs border-danger-400 text-danger-400 btn-flat btn-icon btn-rounded' ><i class='icon-trash'></i></a>";
                        return html;
                    },
                    "sortable": false,
                    "searchable": false
                },

            ],
            "columnDefs": [
                {
                    "targets": 0,
                    "width": "10%",
                    "render": function (data, type, row) {
                        return '<label><input type="checkbox" class="dt-checkbox styled" id="ids_' + row['opportunity_id'] + '" name="ids[]" value="' + row['opportunity_id'] + '"/><span class="lbl"></span></label>';
                    },
                    "sortable": false,
                    "searchable": false
                },
            ],

            fnDrawCallback: function (oSettings) {
                // Switchery
                // Initialize multiple switches
                DtSwitcheryKeyGen();
                CheckboxKeyGen('checkAll');
                CustomToolTip();
                ScrollToTop();
            }
        });
    });

</script>

<script>

    //Delete Time Cancel button click to remove checked value
    $(document).on('click', '.cancel', function () {
        $('#opportunityTable input[class="dt-checkbox styled"]').prop('checked', false);
        CheckboxKeyGen();
    });

    $(document).ready(function () {
        // Switchery
        // Initialize multiple switches
        SwitcheryKeyGen();
        CheckboxKeyGen();
        CustomToolTip();

        $('#checkAll').prop('checked', false);
        $('#checkAll').click(function () {
            var checkedStatus = this.checked;
            $('#opportunityTable tbody tr').find('td:first :checkbox').each(function () {
                $(this).prop('checked', checkedStatus);
            });
            CheckboxKeyGen();
        });


    });

    /// Status change function
    $(document).on('click', '.isActive', function () {
        var currencyId = $(this).attr('id');
        var isActive   = $(this).data("status");
        $.ajax({
            type: "post",
            url: "<?= site_url("Currency/changeStatus")?>",
            dataType: "json",
            data: {currencyId: currencyId, status: isActive},
            success: function (data) {
                if (data) {
                    swal({
                        title: "<?= ucwords(lang('success'))?>",
                        text: data['msg'],
                        type: "<?= lang('success')?>",
                        confirmButtonColor: "<?= BTN_SUCCESS; ?>",
                    },function(){
                        dt_DataTable.ajax.reload(null,false);
                    });
                } else {
                    swal({
                        title: "<?= ucwords(lang('error')); ?>",
                        text: data['msg'],
                        type: "<?= lang('error'); ?>",
                        confirmButtonColor: "<?= BTN_ERROR; ?>"
                    });
                }
            }
        });
    });

    //Delete function
    function DeleteRecord(opportunityId) {
        $('#opportunityTable tbody input[class="dt-checkbox styled"]').prop('checked', false);
        $('#ids_' + opportunityId).prop('checked', true);
        $('.deleteRecord').click();
        CheckboxKeyGen();
    }


    //Delete Record
    $(document).on('click', '.deleteRecord', function () {
        var deleteElement = $('#opportunityTable tbody input[class="dt-checkbox styled"]:checked');
        var selectedLength = deleteElement.size();
      //  CheckboxKeyGen();
        if (selectedLength == 0) {
            swal({
                title: "<?= ucwords(lang('info')); ?>",
                text: "<?= lang('delete_info'); ?>",
                confirmButtonColor: "<?= BTN_DELETE_INFO; ?>",
                type: "<?= lang('info'); ?>"
            },function(){
                return false;
            });
        } else {
            var deleteId = [];
            $.each(deleteElement, function (i, ele) {
                deleteId.push($(ele).val());
            });

            swal({
                    title: "<?= ucwords(lang('delete')); ?>",
                    text: "<?= lang('delete_warning'); ?>",
                    type: "<?= lang('warning'); ?>",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    confirmButtonColor: "<?= BTN_DELETE_WARNING; ?>",
                    showLoaderOnConfirm: true
                },
                function () {
                    $.ajax({
                        type: "post",
                        url: "<?= base_url("Opportunity/delete")?>",
                        dataType: "json",
                        data: {deleteId: deleteId},
                        success: function (data) {
                            if (data['success']) {
                                swal({
                                    title: "<?= ucwords(lang('success'))?>",
                                    text: data['msg'],
                                    type: "<?= lang('success')?>",
                                    confirmButtonColor: "<?= BTN_SUCCESS; ?>",
                                },function () {
                                    dt_DataTable.ajax.reload();
                                    $('#checkAll').prop('checked', false);
                                    CheckboxKeyGen();
                                });
                            } else {
                                swal({
                                    title: "<?= ucwords(lang('error')); ?>",
                                    text: data['msg'],
                                    type: "<?= lang('error'); ?>",
                                    confirmButtonColor: "<?= BTN_ERROR; ?>"
                                },function (){
                                    dt_DataTable.ajax.reload();
                                });
                            }
                        }
                    });
                });
        }
    });


    //Edit function
    function EditRecord(currencyId) {
        $('#opportunityTable  input[class="dt-checkbox styled"]').prop('checked', false);
        $('#ids_' + currencyId).prop('checked', true);
        $('.editRecord').click();
        CheckboxKeyGen();
    }

    //Edit Record
//    $(document).on('click', '.editRecord', function () {
//        var editElement = $('#opportunityTable  input[class=dt-checkbox]:checked');
//        var selectedLength = editElement.size();
//
//        if (selectedLength == 0) {
//            swal({
//                title: "Info",
//                text: "Please select single record to edit.",
//                confirmButtonColor: "#2196F3",
//                type: "info"
//            },function(){
//                return false;
//            });
//        } else if (selectedLength > 1) {
//            swal({
//                title: "Multiple record selected.",
//                confirmButtonColor: "#2196F3"
//            });
//            return false;
//        } else {
//            href = "//= site_url('Currency/manage'); ?>//";
//            href += editElement.val();
//            $('.editRecord').attr('href', href);
//        }
//    });
</script>