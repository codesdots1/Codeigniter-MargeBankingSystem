<div class="panel panel-flat">
    <div class="panel-heading">
        <h5 class="panel-title">Samaj Webservice Log List</h5>
        <div class="heading-elements">

        </div>
    </div>
    <div class="table-responsive">
        <table id="people_webservice_table" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th></th>
                <th> URL </th>
                <th> Method </th>
                <th> Request Time </th>
                <th> Response Time </th>
                <th> Status </th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<script>

    var dt_DataTable;
    $(document).ready(function () {
        dt_DataTable = $('#people_webservice_table').DataTable({
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
                "url": "<?php echo site_url('SamajWebserviceLog/getTableListing'); ?>",
                "type": "POST",
                "data": function (d) {
                    return $.extend({}, d, {
                        "<?= $this->security->get_csrf_token_name() ?>": '<?= $this->security->get_csrf_hash() ?>'
                    });
                }
            },
            "order": [[0, "desc"]],
            "columns": [{
                    "data": "id",
                    "sortable": false,
                    "searchable": false
                },
                {"data": "uri"},
                {"data": "uriMethod",
                    "searchable": false},
                {"data": "time" },
                {"data": "responsetime"},
                {"data": "response_code"}
            ],
            "columnDefs": [{
                "targets": 0,
                "width": "10%",
                "render": function (data, type, row) {
                    return '<div class="viewDtData btn btn-ms btn-icon btn-success btn-round waves-effect"> <i class="icon-plus-circle2"></i> </div>';
                },
                "sortable": false,
                "searchable": false
            }],
            fnDrawCallback: function (oSettings) {

            }
        });
        $('#people_webservice_table tbody').on('click', '.viewDtData', function () {
            var selfElem = $(this);
            var tr = $(this).closest('tr');
            var row = dt_DataTable.row(tr);

            if (row.child.isShown()) {
                row.child.hide();
                selfElem.html("<i class='icon-plus-circle2'>");
                selfElem.removeClass('btn-danger');
            }
            else {
                hideViewDtData();
                row.child(viewDtRow(row.data())).show();
                selfElem.html("<i class='icon-minus-circle2'>");
                selfElem.addClass('btn-danger');
            }
        });

        function hideViewDtData() {
            $(".viewDtData").each(function () {
                var selfElem = $(this);
                var tr = $(this).closest('tr');
                var row = dt_DataTable.row(tr);
                if (row.child.isShown()) {
                    row.child.hide();
                    selfElem.html("<i class='icon-plus-circle2'>");
                    selfElem.removeClass('btn-danger');
                }
            });
        }

        function viewDtRow(d) {
            var urlLogResponse = "<?php echo base_url();?>SamajWebserviceLog/getSamajResponseRequest";
            var img_src = "";
            $.ajax({
                type: "POST",
                url: urlLogResponse,
                dataType: "html",
                data:{logId :d.id},
                success: function (data) {
                    var resquestResponse = "#resq_resp_" + d.id;
                    $(resquestResponse).html(data);
                }
            });
            return '<div id="resq_resp_' + d.id + '"></div>';
        }
    });
</script>
