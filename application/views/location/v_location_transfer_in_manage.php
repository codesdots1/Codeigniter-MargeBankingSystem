<?php
/**
 * Created by PhpStorm.
 * User: dt-user09
 * Date: 7/25/2018
 * Time: 3:32 PM
 */

//printArray($getLocationTransferInData,1);

?>
<div class="panel panel-flat  border-left-lg border-left-slate">
    <div class="panel-heading">
        <h5><?= lang('location_transfer_in_form')?></h5>
    </div>

    <div class="panel-body">
        <?php
        //create  form open tag
        $form_id = array(
            'id' => 'locationTransferInDetails',
            'method' => 'post',
            'autocomplete'=>'off'
        );
        echo form_open_multipart('', $form_id);
        ?>

        <span id="customer_exchange_rate" style="display: none;"><?= json_encode([]) ?></span>
        <span id="company_exchange_rate" style="display: none;"><?= json_encode([]) ?></span>
        <span id="all_exchange_rate" style="display: none;"><?= json_encode([]) ?></span>
        <input type="hidden" class="customer_currency_id" name="customer_currency_id"
               value="<?= isset($getQuotationData['currency_id']) ? $getQuotationData['currency_id'] : '' ?> ">
        <input type="hidden" class="company_currency_id" name="company_currency_id"
               value="<?= isset($getQuotationData['company_currency_id']) ? $getQuotationData['company_currency_id'] : '' ?> ">

        <input type="hidden" name="location_transfer_in_id" value="<?= isset($getLocationTransferInData['location_transfer_in_id']) ? $getLocationTransferInData['location_transfer_in_id'] : '' ?>" id="location_transfer_in_id">

        <!--  Location Transfer In Form-->
        <fieldset class="content-group">
            <legend class="text-bold"> <?= lang('location_transfer_in_details'); ?>  </legend>


            <div class="form-group">

                <div class="row">
                        <div class="form-group col-md-6">
                            <label><?= lang('series') ?></label>
                            <?php if(isset($getLocationTransferInData['location_transfer_in_id']) && $getLocationTransferInData['location_transfer_in_id'] != ''){ ?>
                                <input type="text" class="form-control" name="series" id="series" value="<?= $getLocationTransferInData['prefix'] .$getLocationTransferInData['series'] ?>" readonly>
                            <?php } else { ?>
                                <input type="text" class="form-control" name="series" id="series" value="<?= LOCATION_TRANSFER_IN_PREFIX .$getNextAutoIncrementId ?>" readonly>
                            <?php } ?>
                        </div>

                        <div class="form-group col-md-6">
                            <label><?= lang('location_transfer_out') ?></label>
                            <select data-placeholder="Select <?= lang('location_transfer_out') ?>" name="location_transfer_out_id" id="location_transfer_out_id">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>

                <div class="row">
                    <div class="form-group col-md-6">
                        <label><?= lang('from_warehouse') ?></label>
                        <select class="select" data-placeholder="Select <?= lang('from_warehouse') ?>" name="from_warehouse_id" id="from_warehouse_id">
                            <option value=""></option>
                            <?= CreateOptions("html", "tbl_warehouse", array('warehouse_id', 'warehouse_name'), isset($getLocationTransferInData['from_warehouse_id']) ? $getLocationTransferInData['from_warehouse_id'] : ''); ?>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label><?= lang('to_warehouse') ?></label>
                        <select class="select" data-placeholder="Select <?= lang('to_warehouse') ?>" name="to_warehouse_id" id="to_warehouse_id">
                            <option value=""></option>
                            <?= CreateOptions("html", "tbl_warehouse", array('warehouse_id', 'warehouse_name'), isset($getLocationTransferInData['to_warehouse_id']) ? $getLocationTransferInData['to_warehouse_id'] : ''); ?>
                        </select>
                    </div>
                </div>
            </div>
        </fieldset>
        <!-- End Of Location Transfer In Form -->

<!--        Item-->
        <fieldset class="content-group">
            <legend class="text-bold"> <?= lang('item_details')?> </legend>

            <div class="form-group">
                <?= $v_itemTable; ?>
            </div>
        </fieldset>
<!--       end of item-->
<!--        transporter-->
        <fieldset class="content-group">
            <legend class="text-bold"><?= lang("transporter_info") ?></legend>

                <div class="row">
                    <div class="form-group col-md-6">
                        <label><?= lang('transporter_name') ?></label>
                        <input type="text" class="form-control" name="transporter_name" id="transporter_name"
                               value="<?= (isset($getLocationTransferInData['transporter_name'])) ? $getLocationTransferInData['transporter_name'] : ''; ?>"
                               placeholder="Please Enter <?= lang('transporter_name') ?>">
                    </div>

                    <div class="form-group col-md-6">
                        <label><?= lang('vehicle_no') ?></label>
                        <input type="text" class="form-control" name="vehicle_no" id="vehicle_no"
                               value="<?= (isset($getLocationTransferInData['vehicle_no'])) ? $getLocationTransferInData['vehicle_no'] : ''; ?>"
                               placeholder="Please Enter  <?= lang('vehicle_no') ?>">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label><?= lang('vehicle_dispatch_date') ?></label>
                        <input type="text" class="form-control" name="vehicle_dispatch_date" id="vehicle_dispatch_date"
                               value="<?= (isset($getLocationTransferInData['vehicle_dispatch_date'])) ? $getLocationTransferInData['vehicle_dispatch_date'] : date(PHP_DATE_FORMATE); ?>"
                               placeholder="Select a <?= lang('vehicle_dispatch_date') ?>">
                    </div>
                </div>
        </fieldset>
<!--        end of transporter-->
        <!-- create reset button-->
        <div class="text-right">
            <button type="button" class="btn btn-xs border-slate text-slate btn-flat cancel"
                    onclick="window.location.href='<?php echo site_url('LocationTransferIn'); ?>'"><?= lang('cancel_btn') ?>
                <i class="icon-cross2 position-right"></i></button>

            <button id="submit"
               class="btn btn-xs border-blue text-blue btn-flat btn-ladda btn-ladda-progress submit"
               data-spinner-color="<?= BTN_SPINNER_COLOR; ?>" data-style="fade">
                <span class="ladda-label"><?= lang('submit_btn')?></span>
                <i id="icon-hide" class="icon-arrow-right8 position-right"></i>
            </button>

        </div>
        <?php echo form_close(); ?>
    </div>
</div>

<script>

    var laddaSubmitBtn = Ladda.create(document.querySelector('.submit'));

    $(document).ready(function() {

        CheckboxKeyGen();
        Select2Init();
        numberInit();

        $("#vehicle_dispatch_date").datepicker({
            dateFormat: "<?= DATE_FORMATE ?>",
            todayBtn:  "linked",
            autoclose: true,
            todayHighlight: true,
            onSelect: function(selected) {
                //$("#start_date").datepicker("option", "maxDate", selected)

                if ($(this).valid()) {
                    $(this).removeClass('invalid').addClass('success');
                }
            }
        });

        $("#location_transfer_out_id").select2({
            ajax: {
                url: "<?= site_url('LocationTransferOut/getLocationTransferOut') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '', // search term
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
                }
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

        <?php if((isset($getLocationTransferInData['location_transfer_out']) && ($getLocationTransferInData['location_transfer_out'] != ''))){ ?>
        var option = new Option("<?= $getLocationTransferInData['location_transfer_out']; ?>",
            "<?= $getLocationTransferInData['location_transfer_out_id']; ?>", true, true);
        $('#location_transfer_out_id').append(option).trigger('change');
        <?php } ?>



        var validator = $("#locationTransferInDetails").validate({
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
                series: {
                    required: true
                },
                from_warehouse_id: {
                    required: true
                },
                to_warehouse_id:{
                    required : true
                },
                location_transfer_out_id:{
                    required: true
                }
            },
            messages: {
                series: {
                    required: "Please Select <?= lang('series') ?>"
                },
                from_warehouse_id: {
                    required: "Please Select <?= lang('from_warehouse') ?>"
                },
                to_warehouse_id: {
                    required: "Please Select <?= lang('to_warehouse') ?>"
                },
                location_transfer_out_id:{
                    required: "Please Select <?= lang('location_transfer_out') ?>"
                }
            },
            submitHandler: function (e) {

                $(e).ajaxSubmit({
                    url: '<?php echo site_url("LocationTransferIn/save");?>',
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
                                window.location.href = '<?php echo site_url('LocationTransferIn/');?>';
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