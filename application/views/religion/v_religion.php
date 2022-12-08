<div class="panel panel-flat">
	<div class="panel-heading">
		<h5 class="panel-title"><?= lang('religion_heading') ?></h5>
		<div class="heading-elements">

			<button type="button" data-popup="custom-tooltip" data-original-title="<?= lang('add_religion') ?>"  title="<?= lang('add_religion') ?>" class="btn btn-xs border-slate-400 text-slate-400 btn-flat  btn-icon btn-rounded addReligion"><i class="icon-plus3"></i></button>

			<button type="button" data-popup="custom-tooltip" data-original-title="<?= lang('delete_religion') ?>" title="<?= lang('delete_religion') ?>" class="btn btn-xs border-danger-400 text-danger-400 btn-flat btn-icon btn-rounded deleteRecord"><i class="icon-trash"></i></button>

		</div>
	</div>

	<div class="table-responsive">

		<table id="religionTable" class="table" cellspacing="0" width="100%">
			<thead>
			<tr>
				<th><input id="checkAll" type="checkbox"  class="dt-checkbox styled"></th>
				<th><?= lang('religion_name') ?></th>
				<th><?= lang('action') ?></th>
			</tr>
			</thead>
		</table>
	</div>
</div>

<?= $v_religionModal; ?>

<!--Display the country list-->
<script>
	$(document).ready(function () {

		dt_DataTable = $('#religionTable').DataTable({
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
				"url": "<?= site_url('Religion/getReligionListing'); ?>",
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
				{"data": "religion_id"},
				{"data": "religion_name"},
				{
					"data": "actions",
					"render": function (data, type, row) {
						var html = '';
						var id = row['religion_id'];
						html += "<button value='"+id+"' data-popup='custom-tooltip' data-original-title='<?= lang('edit_religion') ?>'  title='<?= lang('edit_religion') ?>' class='btn btn-xs border-slate-400 text-slate-400 btn-flat btn-icon btn-rounded editRecord'  ><i class='icon-pencil'></i></button>";
						html += "&nbsp";
						html += "<a href='javascript:void(0);' data-popup='custom-tooltip' onclick='DeleteRecord(" + id + ")' data-original-title='<?= lang('delete_religion') ?>' title='<?= lang('delete_religion') ?>'  class='btn btn-xs border-danger-400 text-danger-400 btn-flat btn-icon btn-rounded' ><i class='icon-trash'></i></a>";
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
						return '<label><input type="checkbox" class="dt-checkbox styled" id="ids_' + row['religion_id'] + '" name="ids[]" value="' + row['religion_id'] + '"/></label>';
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