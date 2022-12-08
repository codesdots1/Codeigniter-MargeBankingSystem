<?php
//    printArray($getLocationData,1);
?>

<div class="panel panel-flat  border-left-lg border-left-slate">
    <div class="panel-heading">
        <h5 class="panel-title"><?= lang("location_form") ?></h5>
    </div>

    <div class="panel-body">
        <?php
        //create  form open tag
        $form_id = array(
            'id' => 'locationDetails',
            'method' => 'post',
            'autocomplete'=>'off'
        );
        echo form_open_multipart('', $form_id);
        ?>

        <input type="hidden" name="location_id" id="location_id"
               value="<?= isset($getLocationData['location_id']) ? $getLocationData['location_id'] : '' ?>">

        <fieldset class="content-group">
            <legend class="text-bold"><?= lang("location_info") ?></legend>

            <div class="form-group">
                <div class="row">

                     <div class="col-md-6">
                        <div class="form-group">
                            <label><?= lang('location_name') ?></label>
                            <input type="text" class="form-control" name="location_name" id="location_name"
                                   value="<?= isset($getLocationData['location_name']) ? $getLocationData['location_name'] : '' ?>"
                                   placeholder="Please Enter <?= lang('location_name') ?>">
                        </div>

                         <div class="form-group">
                            <label><?= lang('address') ?></label>
                            <textarea rows="2" cols="5"  style="resize: vertical" class="form-control" name="address" id="address"
                                   value="<?= isset($getLocationData['address']) ? $getLocationData['address'] : '' ?>"
                                      placeholder="Please Enter <?= lang('address') ?>"></textarea>
                        </div>



                         <div class="form-group">
                             <label><?= lang('warehouse') ?></label>
                             <select data-placeholder="Select Your <?= lang('warehouse') ?>" name="warehouse_id" id="warehouse_id">
                                 <option value=""></option>

                             </select>
                         </div>

                         <div class="form-group">
                             <label><?= lang('company') ?></label>
                             <select data-placeholder="Select Your <?= lang('company') ?>" name="company_id" id="company_id" class="select">
                                 <option value=""></option>
                             <?= CreateOptions("html", "tbl_company", array('company_id', 'company_name'), isset($getLocationData['company_id']) ? $getLocationData['company_id'] : ''); ?>

                             </select>
                         </div>

                         <div class="form-group">
                             <label><?= lang('is_active') ?></label>
                             <div class="checkbox checkbox-switchery switchery-xs">
                                 <label>
                                     <input type="checkbox" name="is_active" id="is_active" class="switchery"<?php if(isset($getLocationData['is_active']) && $getLocationData['is_active'] == 1) {  echo 'checked="checked"'; } else { echo ''; } ?>>
                                 </label>
                             </div>
                         </div>

                     </div>
                    <div class="col-md-6">
                         <div class="form-group">
                             <label><?= lang('parent_location') ?></label>
                             <select data-placeholder="Select Your <?= lang('parent_location') ?>" name="parent_location_id" id="parent_location_id"">
                                 <option value=""></option>

                             </select>
                         </div>

                        <div class="form-group">
                            <label><?= lang('country') ?></label>
                            <select data-placeholder="Select your <?= lang('country') ?>" name="country_id" id="country_id" class="select">
                                <option value=""></option>
                            </select>
                         </div>

                        <div class="form-group">
                            <label><?= lang('state') ?></label>
                            <select data-placeholder="Select your <?= lang('state') ?>" name="state_id" id="state_id" class="select">
                                <option value=""></option>
                            </select>
                         </div>

                        <div class="form-group">
                            <label><?= lang('city') ?></label>
                            <select data-placeholder="Select Your <?= lang('city') ?>" name="city_id" id="city_id"
                                    class="select">
                                <option value=""></option>

                            </select>
                        </div>

                        <div class="form-group">
                            <label><?= lang('pincode') ?></label>
                            <input type="tel" class="form-control numberInit" name="pincode" id="pincode"
                                   value="<?= isset($getLocationData['pincode']) ? $getLocationData['pincode'] : '' ?>"
                                   placeholder="Please Enter <?= lang('pincode') ?>">
                        </div>



                    </div>
                </div>
            </div>
        </fieldset>
        <div class="text-right">
            <button type="button" class="btn btn-xs border-slate text-slate btn-flat cancel"
                    onclick="window.location.href='<?php echo site_url('Location'); ?>'"><?= lang('cancel_btn') ?> <i
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

        numberInit();
        CustomToolTip();
        CheckboxKeyGen();
        Select2Init();



        CountryStateCityDD("<?= isset($getLocationData['country_id']) ? $getLocationData['country_id'] : '' ?>", "<?= isset($getLocationData['state_id']) ? $getLocationData['state_id'] : '' ?>","<?= isset($getLocationData['city_id']) ? $getLocationData['city_id'] : '' ?>");


        <?php if((isset($getLocationData['country_name']) && ($getLocationData['country_name'] != ''))){ ?>
        var option = new Option("<?= $getLocationData['country_name']; ?>",
            "<?= $getLocationData['country_id']; ?>", true, true);
        $('#country_id').append(option).trigger('change');
        <?php } ?>


        <?php if((isset($getLocationData['state_name']) && ($getLocationData['state_name'] != ''))){ ?>
        var option = new Option("<?= $getLocationData['state_name']; ?>",
            "<?= $getLocationData['state_id']; ?>", true, true);
        $('#state_id').append(option).trigger('change');
        <?php } ?>

        <?php if((isset($getLocationData['city_name']) && ($getLocationData['city_name'] != ''))){ ?>
        var option = new Option("<?= $getLocationData['city_name']; ?>",
            "<?= $getLocationData['city_id']; ?>", true, true);
        $('#city_id').append(option).trigger('change');
        <?php } ?>

        <?php if((isset($getLocationData['parent_location_id']) && ($getLocationData['parent_location_id'] != '') && ($getLocationData['parent_location_id'] > 0))){ ?>
        var option = new Option("<?= $getLocationData['parent_location']; ?>",
            "<?= $getLocationData['parent_location_id']; ?>", true, true);
        $('#parent_location_id').append(option).trigger('change.select2');
        <?php } ?>

        var location_id = $("#location_id").val();

        $("#parent_location_id").select2({
            ajax: {
                url: "<?= site_url('Location/getLocation') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '', // search term
                        location_id: location_id,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                },
                //cache: true
            },

            escapeMarkup: function (markup) {
                return markup;
            },

        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });

        <?php if((isset($getLocationData['warehouse_id']) && ($getLocationData['warehouse_id'] != ''))){ ?>
        var option = new Option("<?= $getLocationData['warehouse_name']; ?>",
            "<?= $getLocationData['warehouse_id']; ?>", true, true);
        $('#warehouse_id').append(option).trigger('change.select2');
        <?php } ?>

        $("#warehouse_id").select2({
            ajax: {
                url: "<?= site_url('Warehouse/getWarehouse') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '', // search term
                        shipping_rule_id: "",
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                },
                //cache: true
            },

            escapeMarkup: function (markup) {
                return markup;
            },

        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });



        // Initialize
        var validator = $("#locationDetails").validate({
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
                location_name: {
                    required: true
                },
                pincode:{
                    digits: true
                },
                company_id: {
                    required: true,
                }
            },
            messages: {
                location_name: {
                    required: "Please Enter <?= lang('location_name') ?>",
                },
                company_id: {
                    required: "Please Select <?= lang('company') ?>",
                },
            },
            submitHandler: function (e) {

                $(e).ajaxSubmit({
                    url: '<?php echo site_url("Location/save");?>',
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
                                window.location.href = '<?php echo site_url('Location');?>';
                            });
                        } else {
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
        SwitcheryKeyGen();
    });

</script>

