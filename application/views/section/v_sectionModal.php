<!--country modal code here -->
<div id="sectionModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h5 class="modal-title"><?= lang('section_form') ?></h5>
			</div>

			<div class="modal-body">
				<?php
				$form_id = array(
					'id'=>'sectionDetails',
					'method'=>'post',
					'class'=>'form-horizontal'
				);?>
				<?= form_open('',$form_id); ?>
				<input type="hidden" name="section_id" id="section_id">

				<!-- religion name -->

				<div class="form-group">
					<label class="col-lg-3 control-label"><?= lang('section_name') ?></label>
					<div class="col-lg-9">
						<input type="text" name="section_name" id="section_name" class="form-control"
							   placeholder="Enter <?= lang('section_name') ?>">

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

<!--  add,update and delete model code here-->
<script>

	var laddaSubmitBtn = Ladda.create(document.querySelector('.submit'));

	$(document).on('hide.bs.modal', '#sectionModal', function () {
		$('#sectionTable input').prop('checked', false);
		CheckboxKeyGen();
	});

	//Delete Time Cancel button click to remove checked value
	$(document).on('click', '.cancel', function () {
		$('#sectionTable input[class="dt-checkbox styled"]').prop('checked', false);
		CheckboxKeyGen();
	});

	$(document).ready(function () {
		CustomToolTip();
		CheckboxKeyGen('checkAll');

		//$('#checkAll').prop('checked', false);
		$('#checkAll').click(function () {
			var checkedStatus = this.checked;
			$('#sectionTable tbody tr').find('td:first :checkbox').each(function () {
				$(this).prop('checked', checkedStatus);
			});
			CheckboxKeyGen();
		});


		$('#sectionModal').on('shown.bs.modal', function () {
			$('#section_name').focus();
		});

		//country model open
		$('.addSection').click(function () {
			DtFormClear('sectionDetails');
			$("form#sectionDetails input[name=section_id]").val('');
			$('#sectionModal').modal('show');
		});

		//Country model validation
		var validator = $("#sectionDetails").validate({
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
				section_name: {
					required: true,
					remote: {
						url: "<?php echo site_url( "Section/NameExist");?>",
						type: "post",
						data: {
							column_name: function () {
								return "section_name";
							},
							column_id: function () {
								return $("#section_id").val();
							},
							table_name: function () {
								return "tbl_section";
							}
						}
					}
				},
			},
			messages: {
				section_name: {
					required: "Please Enter <?= lang('section_name') ?>",
					remote  : "<?= lang('section_name') ?> Already Exist",

				}
			},
			submitHandler: function (e) {
				$(e).ajaxSubmit({
					url: '<?php echo site_url("Section/save");?>',
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
							$('#sectionModal').modal('hide');
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
										var option = new Option(resObj.section_name, resObj.section_id, true, true);
										$('#SectionList').append(option).trigger('change');
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

	/// Status change function

	//Delete function
	function DeleteRecord(sectionId) {
		$('#sectionTable tbody input[class="dt-checkbox styled"]').prop('checked', false);
		$('#ids_' + sectionId).prop('checked', true);
		$('.deleteRecord').click();
		CheckboxKeyGen();
	}


	//Delete Record
	$(document).on('click', '.deleteRecord', function () {
		var deleteElement = $('#sectionTable tbody input[class="dt-checkbox styled"]:checked');
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
						url: "<?= base_url("Section/delete")?>",
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
	function EditRecord(sectionId) {
		$('#sectionTable  input[class="dt-checkbox styled"]').prop('checked', false);
		$('#ids_' + sectionId).prop('checked', true);
		$('.editRecord').click();
	}




	$(document).on('click', '.editRecord', function () {
		$('#sectionTable input[class="dt-checkbox styled"]').prop('checked', false);
		$("form#sectionDetails .validation-error-label").html('');

		var id = $(this).val();
		$("#ids_" + id).prop("checked", true);
		var edit_val = $('.dt-checkbox:checked').val();

		var selected_tr = $('.dt-checkbox:checked');
		var element = $(selected_tr).closest('tr').get(0);
		var aData = dt_DataTable.row(element).data();

		DtFormFill('sectionDetails', aData);

		$('#sectionModal').modal('show');

	});

</script>
