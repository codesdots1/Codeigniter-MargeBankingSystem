<div class="panel panel-flat">
	<div class="panel-heading">
		<h5 class="panel-title"><?= lang('scheme_heading') ?></h5>
		<div class="heading-elements">

			<button type="button" data-popup="custom-tooltip" data-original-title="<?= lang('add_scheme') ?>"  title="<?= lang('add_scheme') ?>" class="btn btn-xs border-slate-400 text-slate-400 btn-flat  btn-icon btn-rounded addScheme"><i class="icon-plus3"></i></button>

			<button type="button" data-popup="custom-tooltip" data-original-title="<?= lang('delete_scheme') ?>" title="<?= lang('delete_scheme') ?>" class="btn btn-xs border-danger-400 text-danger-400 btn-flat btn-icon btn-rounded deleteRecord"><i class="icon-trash"></i></button>

		</div>
	</div>

	<div class="table-responsive">

		<table id="schemeTable" class="table" cellspacing="0" width="100%">
			<thead>
			<tr>
				<th><input id="checkAll" type="checkbox"  class="dt-checkbox styled"></th>
				<th><?= lang('scheme_name') ?></th>
				<th><?= lang('scheme_code') ?></th>
				<th><?= lang('action') ?></th>
			</tr>
			</thead>
		</table>
	</div>
</div>

<?= $v_schemeModal; ?>

<!--Display the country list-->
<script>
	$(document).ready(function () {

		dt_DataTable = $('#schemeTable').DataTable({
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
				"url": "<?= site_url('Scheme/getSchemeListing'); ?>",
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
				{"data": "scheme_id"},
				{"data": "scheme_name"},
				{"data": "scheme_code"},
				{
					"data": "actions",
					"render": function (data, type, row) {
						var html = '';
						var id = row['scheme_id'];
						html += "<button value='"+id+"' data-popup='custom-tooltip' data-original-title='<?= lang('edit_scheme') ?>'  title='<?= lang('edit_scheme') ?>' class='btn btn-xs border-slate-400 text-slate-400 btn-flat btn-icon btn-rounded editRecord'  ><i class='icon-pencil'></i></button>";
						html += "&nbsp";
						html += "<a href='javascript:void(0);' data-popup='custom-tooltip' onclick='DeleteRecord(" + id + ")' data-original-title='<?= lang('delete_scheme') ?>' title='<?= lang('delete_scheme') ?>'  class='btn btn-xs border-danger-400 text-danger-400 btn-flat btn-icon btn-rounded' ><i class='icon-trash'></i></a>";
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
						return '<label><input type="checkbox" class="dt-checkbox styled" id="ids_' + row['scheme_id'] + '" name="ids[]" value="' + row['scheme_id'] + '"/></label>';
					},
					"sortable": false,
					"searchable": false
				}
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
