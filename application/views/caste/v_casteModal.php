<!--state modal code here -->
<div id="casteModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h5 class="modal-title"><?= lang('caste_form') ?></h5>
			</div>

			<div class="modal-body">
				<?php
				$form_id = array(
					'id'=>'casteDetails',
					'method'=>'post',
					'class'=>'form-horizontal'
				);?>
				<?= form_open('',$form_id); ?>
				<input type="hidden" name="caste_id" id="caste_id">

				<!-- Country -->
				<div class="form-group">
					<label class="col-lg-3 control-label"><?= lang('religion_name') ?></label>
					<div class="col-lg-9">
						<select name="religion_id" id="religion_id" data-init="1" data-placeholder="Select <?= lang('religion_name') ?>"
								class="select">
							<option value=""></option>
							<?php foreach ($religionData as $religion) { ?>
								<option value="<?php echo $religion['religion_id'] ?>"><?php echo $religion['religion_name'] ?></option>
							<?php } ?>
						</select>
					</div>

				</div>

				<div class="form-group">
					<label class="col-lg-3 control-label"><?= lang('caste_name') ?></label>
					<div class="col-lg-9">
						<input type="text" name="caste_name" id="caste_name" class="form-control"
							   placeholder="Enter <?= lang('caste_name') ?>">

					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="reset" name="cancel"
						class="btn btn-xs border-slate text-slate btn-flat cancel"
						data-dismiss="modal"><?= lang('cancel_btn') ?> <i class="icon-cross2 position-right"></i></button>

				<button type="submit"
						class="btn btn-xs border-blue text-blue btn-flat btn-ladda btn-ladda-progress submit"
						data-spinner-color="#03A9F4" data-style="fade"><span
						class="ladda-label"><?= lang('submit_btn') ?></span>
					<i id="icon-hide" class="icon-arrow-right8 position-right"></i>
				</button>
				<?= form_close(); ?>
			</div>
		</div>
	</div>
</div>

<!--  add,update modal code here-->
<script>

	var laddaSubmitBtn = Ladda.create(document.querySelector('.submit'));

	$(document).on('hide.bs.modal', '#casteModal', function () {
		$('#casteTable input').prop('checked', false);
		CheckboxKeyGen();
	});

	//Delete Time Cancel button click to remove checked value
	$(document).on('click', '.cancel', function () {
		$('#casteTable input[class="dt-checkbox styled"]').prop('checked', false);
		CheckboxKeyGen();
	});

	$(document).ready(function () {

		// Select with search
		$('.select').select2();
		CustomToolTip();
		CheckboxKeyGen('checkAll');

		//$('#checkAll').prop('checked', false);
		$('#checkAll').click(function () {
			var checkedStatus = this.checked;
			$('#casteTable tbody tr').find('td:first :checkbox').each(function () {
				$(this).prop('checked', checkedStatus);
			});
			CheckboxKeyGen();
		});


		$('#casteModal').on('shown.bs.modal', function () {
			$('#religion_id').focus();
		});

		//state modal open
		$('.addCaste').click(function () {
			DtFormClear('casteDetails');
			$("form#casteDetails input[name=caste_id]").val('');
			//$("form#casteDetails select").val('').trigger('change');
			$('#casteModal').modal('show');
		});

		//State modal validation
		var validator = $("#casteDetails").validate({
			ignore: 'input[type=hidden], .select2-search__field', // ignore hidden fields
			errorClass: 'validation-error-label',
			successClass: 'validation-valid-label',
			highlight: function(element, errorClass) {
				$(element).removeClass(errorClass);
			},
			unhighlight: function(element, errorClass) {
				$(element).removeClass(errorClass);
			},

			// Different components require proper error label placement
			errorPlacement: function(error, element) {

				// Styled checkboxes, radios, bootstrap switch
				if (element.parents('div').hasClass("checker") || element.parents('div').hasClass("choice") || element.parent().hasClass('bootstrap-switch-container') ) {
					if(element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
						error.appendTo( element.parent().parent().parent().parent() );
					}
					else {
						error.appendTo( element.parent().parent().parent().parent().parent() );
					}
				}

				// Unstyled checkboxes, radios
				else if (element.parents('div').hasClass('checkbox') || element.parents('div').hasClass('radio')) {
					error.appendTo( element.parent().parent().parent() );
				}

				// Input with icons and Select2
				else if (element.parents('div').hasClass('has-feedback') || element.hasClass('select2-hidden-accessible')) {
					error.appendTo( element.parent() );
				}

				// Inline checkboxes, radios
				else if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
					error.appendTo( element.parent().parent() );
				}

				// Input group, styled file input
				else if (element.parent().hasClass('uploader') || element.parents().hasClass('input-group')) {
					error.appendTo( element.parent().parent() );
				}

				else {
					error.insertAfter(element);
				}
			},
			validClass: "validation-valid-label",
			success: function(label) {
				label.addClass("validation-valid-label").text("Success.")
			},
			rules: {
				caste_name: {
					required: true
				},
				religion_id: {
					required: true
				}
			},
			messages: {
				caste_name: {
					required: "Please Enter <?= lang('caste_name') ?>",
				},
				religion_id: {
					required: "Please Select <?= lang('religion_name') ?>"
				}
			},
			submitHandler: function (e) {
				$(e).ajaxSubmit({
					url: '<?php echo site_url("Caste/save");?>',
					type: 'post',
					beforeSubmit: function (formData, jqForm, options) {
						laddaStart();
					},
					complete: function () {
						laddaStop();
					},
					dataType: 'json',
					clearForm: false,
					success: function (resObj) {
						if(resObj.success){
							$('#casteModal').modal('hide');
							swal({
									title: "<?= ucwords(lang('success')); ?>",
									text: resObj.msg,
									confirmButtonColor: "<?= BTN_SUCCESS; ?>",
									type: "<?= lang('success'); ?>"
								},
								function () {
									if(typeof dt_DataTable !== 'undefined' ) {
										dt_DataTable.ajax.reload();
									} else {
										var option = new Option(resObj.religion_name, resObj.caste_id, true, true);
										$('#ReligionList').append(option).trigger('change');
									}
								});
						}else{
							swal({
								title: "<?= ucwords(lang('error')); ?>",
								text: resObj.msg,
								type: "<?= lang('error'); ?>",
								confirmButtonColor: "<?= BTN_ERROR; ?>"
							});
						}
					}
				});
			}
		});
	});

	function DeleteRecord(casteId) {
		$('#casteTable tbody input[class="dt-checkbox styled"]').prop('checked', false);
		$('#ids_' + casteId).prop('checked', true);
		$('.deleteRecord').click();
		CheckboxKeyGen();
	}


	//Delete Record
	$(document).on('click', '.deleteRecord', function () {
		var deleteElement = $('#casteTable tbody input[class="dt-checkbox styled"]:checked');
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
						url: "<?= base_url("Caste/delete")?>",
						dataType: "json",
						data: {deleteId: deleteId},
						success: function (data) {
							if (data['success']) {
								swal({

									title: "<?= ucwords(lang('success'))?>",
									text: data['msg'],
									type: "<?= lang('success')?>",
									confirmButtonColor: "<?= BTN_SUCCESS; ?>",
								},function(){
									dt_DataTable.ajax.reload();
									// $('#checkAll').prop('checked', false);
									CheckboxKeyGen('checkAll');
								});
							} else {
								swal({
									title: "<?= ucwords(lang('error')); ?>",
									text: data['msg'],
									type: "<?= lang('error'); ?>",
									confirmButtonColor: "<?= BTN_ERROR; ?>"
								},function(){
									dt_DataTable.ajax.reload();
									CheckboxKeyGen('checkAll');
								});
							}
						}
					});
				});
		}
	});




	//Edit function
	function EditRecord(casteId) {
		$('#casteTable  input[class="dt-checkbox styled"]').prop('checked', false);
		$('#ids_' + casteId).prop('checked', true);
		$('.editRecord').click();
	}

	$(document).on('click', '.editRecord', function () {
		$('#casteTable input[class="dt-checkbox styled"]').prop('checked', false);
		$("form#casteDetails .validation-error-label").html('');

		var id = $(this).val();
		$("#ids_" + id).prop("checked", true);
		var edit_val = $('.dt-checkbox:checked').val();

		var selected_tr = $('.dt-checkbox:checked');
		var element = $(selected_tr).closest('tr').get(0);
		var aData = dt_DataTable.row(element).data();

		DtFormFill('casteDetails', aData);

		$('#casteModal').modal('show');

	});

</script>
