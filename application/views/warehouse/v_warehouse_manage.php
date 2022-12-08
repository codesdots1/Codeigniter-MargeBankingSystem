<div class="panel panel-flat  border-left-lg border-left-slate">
    <div class="panel-heading">
        <h5 class="panel-title"><?= lang('warehouse_form') ?></h5>
    </div>

    <div class="panel-body">
        <?php
        //create  form open tag
        $form_id = array(
            'id' => 'warehouseDetails',
            'method' => 'post',
            'autocomplete' => 'off'
        );
        echo form_open_multipart('', $form_id);
        ?>

        <input type="hidden" name="warehouse_id" value="<?= isset($getWarehouseData['warehouse_id']) ? $getWarehouseData['warehouse_id'] : '' ?>" id="warehouse_id">

        <!-- Warehouse Information -->
        <fieldset class="content-group">
            <legend class="text-bold"><?= lang('warehouse_details') ?></legend>

            <div class="form-group">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label><?= lang('warehouse_name') ?></label>
                        <input type="text" class="form-control" name="warehouse_name" id="warehouse_name"
                               value="<?= isset($getWarehouseData['warehouse_name']) ? $getWarehouseData['warehouse_name'] : '' ?>"
                               placeholder="Please Enter <?= lang('warehouse_name') ?>">
                    </div>

                    <div class="form-group col-md-6">
                        <label><?= lang('company') ?></label>
                        <select class="form-control select" name="company_id" id="company_id" value="" data-placeholder="Please Select <?= lang('company') ?>">
                            <option value=""></option>
                            <?= CreateOptions("html","tbl_company",array("company_id","company_name"),isset($getWarehouseData['company_id']) ? $getWarehouseData['company_id'] : $defaultCompanyId,'',"company_id =". $defaultCompanyId ); ?>
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                        <label><?= lang('warehouse_code') ?></label>
                        <input type="text" class="form-control" name="warehouse_code" id="warehouse_code"
                               value="<?= isset($getWarehouseData['warehouse_code']) ? $getWarehouseData['warehouse_code'] : '' ?>"
                               placeholder="Please Enter <?= lang('warehouse_code') ?>">
                    </div>

                </div>
            </div>
        </fieldset>
        <!-- End Warehouse Information -->

        <!--Default Values-->
        <fieldset class="content-group">
            <legend class="text-bold"><?= lang('warehouse_contact_info') ?></legend>

                <div class="row form-group">
                    <div class="col-md-6">
                        <label><?= lang('address_line_1') ?></label>
                        <textarea rows="10" cols="5" style="resize:vertical" name="address_line_1" id="address_line_1" class="form-control" placeholder="Enter <?= lang('address_line_1') ?>"><?= isset($getWarehouseData['address_line_1']) ? $getWarehouseData['address_line_1'] : '' ?></textarea>
                    </div>
                    <div class="form-group col-md-6">
                        <label><?= lang('address_line_2') ?></label>
                        <textarea rows="10" cols="5" style="resize:vertical" name="address_line_2" id="address_line_2" class="form-control" placeholder="Enter <?= lang('address_line_2') ?>"><?= isset($getWarehouseData['address_line_2']) ? $getWarehouseData['address_line_2'] : '' ?></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label><?= lang('phone_no') ?></label>
                        <input type="tel" class="form-control" name="phone_no" id="phone_no"
                               value="<?= isset($getWarehouseData['phone_no']) ? $getWarehouseData['phone_no'] : '' ?>"
                               placeholder="Please Enter <?= lang('phone_no') ?>">
                    </div>
                    <div class="form-group col-md-6">
                        <label><?= lang('mobile_no') ?></label>
                        <input type="tel" class="form-control" name="mobile_no" id="mobile_no"
                               value="<?= isset($getWarehouseData['mobile_no']) ? $getWarehouseData['mobile_no'] : '' ?>"
                               placeholder="Please Enter <?= lang('mobile_no') ?>">
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <label><?= lang('country') ?></label>
                        <select class="form-control" name="country_id" id="country_id" ></select>
                    </div>

                    <div class="form-group col-md-6">
                        <label><?= lang('state') ?></label>
                        <select class="form-control" name="state_id" id="state_id"></select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label><?= lang('city') ?></label>
                        <select class="form-control" name="city_id" id="city_id" ></select>
                    </div>

                    <div class="form-group col-md-6">
                        <label><?= lang('pin') ?></label>
                        <input type="tel" class="form-control" name="pin" id="pin"
                               value="<?= isset($getWarehouseData['pin']) ? $getWarehouseData['pin'] : '' ?>"
                               placeholder="Please Enter <?= lang('pin') ?>">
                    </div>
                </div>

        </fieldset>
        <!-- End Address and contact -->


        <!-- create reset button-->
        <div class="text-right">
            <button type="button" class="btn btn-xs border-slate text-slate btn-flat cancel"
                    onclick="window.location.href='<?php echo site_url('Warehouse'); ?>'"><?= lang('cancel_btn') ?> <i
                        class="icon-cross2 position-right"></i></button>
            <button type="submit" id="submit"
                    class="btn btn-xs border-blue text-blue btn-flat btn-ladda btn-ladda-progress submit"
                    data-spinner-color="<?= BTN_SPINNER_COLOR; ?>" data-style="fade">
                <span class="ladda-label"><?= lang('submit_btn') ?></span>
                <i id="icon-hide" class="icon-arrow-right8 position-right"></i>
            </button>

        </div>
        <?php echo form_close(); ?>
    </div>
</div>
<script>

    var laddaSubmitBtn = Ladda.create(document.querySelector('.submit'));

    $(document).ready(function () {

        $("#company_id").trigger('change');
        $('#company_id-error').html("");

        <?php if((isset($getWarehouseData['country_name']) && ($getWarehouseData['country_name'] != ''))){ ?>
        var option = new Option("<?= $getWarehouseData['country_name']; ?>",
            "<?= $getWarehouseData['country_id']; ?>", true, true);
        $('#country_id').append(option).trigger('change');
        <?php } ?>

        <?php if((isset($getWarehouseData['state_name']) && ($getWarehouseData['state_name'] != ''))){ ?>
        var option = new Option("<?= $getWarehouseData['state_name']; ?>",
            "<?= $getWarehouseData['state_id']; ?>", true, true);
        $('#state_id').append(option).trigger('change');
        <?php } ?>
        
        <?php if((isset($getWarehouseData['city_name']) && ($getWarehouseData['city_name'] != ''))){ ?>
        var option = new Option("<?= $getWarehouseData['city_name']; ?>",
            "<?= $getWarehouseData['city_id']; ?>", true, true);
        $('#city_id').append(option).trigger('change');
        <?php } ?>

        CountryStateCityDD();
        Select2Init();

        // Initialize
        var validator = $("#warehouseDetails").validate({
            ignore: 'input[type=hidden], .select2-search__field', // ignore hidden fields
            errorClass: 'validation-error-label',
            successClass: 'validation-valid-label',
            highlight: function (element, errorClass) {
                $(element).removeClass(errorClass);
            },
            unhighlight: function (element, errorClass) {
                $(element).removeClass(errorClass);
            },

            // Different components require proper error label placement
            errorPlacement: function (error, element) {

                // Styled checkboxes, radios, bootstrap switch
                if (element.parents('div').hasClass("checker") || element.parents('div').hasClass("choice") || element.parent().hasClass('bootstrap-switch-container')) {
                    if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
                        error.appendTo(element.parent().parent().parent().parent());
                    }
                    else {
                        error.appendTo(element.parent().parent().parent().parent().parent());
                    }
                }

                // Unstyled checkboxes, radios
                else if (element.parents('div').hasClass('checkbox') || element.parents('div').hasClass('radio')) {
                    error.appendTo(element.parent().parent().parent());
                }

                // Input with icons and Select2
                else if (element.parents('div').hasClass('has-feedback') || element.hasClass('select2-hidden-accessible')) {
                    error.appendTo(element.parent());
                }

                // Inline checkboxes, radios
                else if (element.parents('label').hasClass('checkbox-inline') || element.parents('label').hasClass('radio-inline')) {
                    error.appendTo(element.parent().parent());
                }

                // Input group, styled file input
                else if (element.parent().hasClass('uploader') || element.parents().hasClass('input-group')) {
                    error.appendTo(element.parent().parent());
                }

                else {
                    error.insertAfter(element);
                }
            },
            validClass: "validation-valid-label",
            success: function (label) {
                label.addClass("validation-valid-label").text("Success.")
            },
            rules: {
                warehouse_name:{
                    required:true
                },
                company_id:{
                    required:true
                },
                address_line_1:{
                    required:true
                },
                address_line_2:{
                    required:true
                },
                phone_no:{
                    required:true,
                    number:true
                },
                mobile_no:{
                    required:true,
                    number:true
                },
                state_id:{
                    required:true
                },
                city_id:{
                    required:true
                },
                country_id:{
                    required:true
                },
                pin:{
                    required:true
                },
                warehouse_code: {
                    required: true
                }
            },
            messages: {
                warehouse_name:{
                    required:"Please Enter <?= lang('warehouse_name') ?>"
                },
                company_id:{
                    required:"Please Select <?= lang('company') ?>"
                },
                address_line_1:{
                    required:"Please Enter <?= lang('address_line_1') ?>"
                },
                address_line_2:{
                    required:"Please Enter <?= lang('address_line_2') ?>"
                },
                phone_no:{
                    required:"Please Enter <?= lang('phone_no') ?>",
                    number:"Please Enter a Valid <?= lang('phone_no') ?>"
                },
                mobile_no:{
                    required:"Please Enter <?= lang('mobile_no') ?>",
                    number:"Please Enter a Valid <?= lang('mobile_no') ?>"
                },
                state_id:{
                    required:"Please Select <?= lang('state') ?>"
                },
                city_id:{
                    required:"Please Select <?= lang('city') ?>"
                },
                country_id:{
                    required:"Please Select <?= lang('country') ?>"
                },
                pin:{
                    required:"Please Enter <?= lang('pin') ?>"
                },
                warehouse_code:{
                    required: "Please Enter <?= lang('warehouse_code') ?>"
                }
            },
            submitHandler: function (e) {
                $(e).ajaxSubmit({
                    url: '<?php echo site_url("Warehouse/save");?>',
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
                        if (resObj.success) {
                            swal({
                                title: "<?= ucwords(lang('success')); ?>",
                                text: resObj.msg,
                                confirmButtonColor: "<?= BTN_SUCCESS; ?>",
                                type: "<?= lang('success'); ?>"
                            }, function () {
                                window.location.href = '<?php echo site_url('Warehouse');?>';
                            });
                        } else {
                            swal({
                                title: "<?= ucwords(lang('error')); ?>",
                                text: resObj.msg,
                                type: "<?= lang('error'); ?>",
                                confirmButtonColor: "<?= BTN_ERROR; ?>"
                            },function(){

                            });
                        }
                    }
                });
            }
        });
        SwitcheryKeyGen();
    });

//    $(document).on('change','#company_id',function(){
//        $('#state_id').val(null).trigger('change');
//        $('#state_id-error').html("");
//        $('#city_id').val(null).trigger('change');
//        $('#city_id-error').html("");
//        $.ajax({
//            type: "post",
//            url: "<?//= site_url("Warehouse/getCompanyData")?>//",
//            dataType: "json",
//            data: {companyId: $(this).val()},
//            success: function (data) {
//                if (data) {
//                    var option = new Option(data.country_name, data.country_id, true, true);
//                    $('#country_id').append(option).trigger('change');
//                } else {
//                    $('#country_id').val('').trigger('change');
//                }
//            }
//        });
//    });



</script>

