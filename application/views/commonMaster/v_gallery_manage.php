
<div class="panel panel-flat border-left-lg border-left-slate">
    <div class="panel-heading ">
        <h5 class="panel-title"><?= lang('gallery_index_heading') ?><a class="heading-elements-toggle"><i
                        class="icon-more"></i></a>
        </h5>
        <div class="heading-elements">
            <ul class="icons-list">
                <li><a data-action="collapse"></a></li>
            </ul>
        </div>
    </div>

    <div class="panel-body">
        <?php
        //create  form open tag
        $form_id = array(
            'id' => 'galleryDetails',
            'method' => 'post',
            'class' => 'form-horizontal'
        );
        echo form_open_multipart('', $form_id);
        ?>
        <input type="hidden" name="gallery_id" value="<?=(isset($getGalleryData['gallery_id']) && ($getGalleryData['gallery_id'] != '')) ? $getGalleryData['gallery_id'] : '' ?>" id="gallery_id">
        <div class="tabbable">

            <ul class="nav nav-tabs">
                <?php
                if(is_array($languages) && count($languages) > 0){
                    foreach ($languages as $languageCount => $languageData) {
                        ?>
                        <li role="presentation" class = "<?= ($languageCount == 0) ? "active" : ""; ?>">
                            <a aria-expanded="true" href="#tab_<?= $languageData['language_id']; ?>" data-toggle="tab">
                                <?=  $languageData['language_name'];?>
                            </a>
                        </li>
                    <?php }
                } ?>

            </ul>
            <div class="tab-content">
                <?php if(is_array($languages) && count($languages) > 0) {
                    foreach ($languages as $languageCount => $languageData) {
                        ?>
                        <div role="tabpanel" class="<?= ($languageCount == 0) ? "tab-pane active" : "tab-pane"; ?>"
                             id="tab_<?= $languageData['language_id']; ?>">
                            <input type="hidden" name="language_id[]"
                                   value="<?= (isset($languageData['language_id']) && ($languageData['language_id'] != '')) ? $languageData['language_id'] : '' ?>"
                                   id="">
                            <input type="hidden" name="gallery_description_id[]"
                                   value="<?= (isset($getDescGalleryData[$languageData['language_id']]['gallery_description_id']) && ($getDescGalleryData[$languageData['language_id']]['gallery_description_id'] != '')) ? $getDescGalleryData[$languageData['language_id']]['gallery_description_id'] : ''; ?>"
                                   id="">

                            <?php if ($languageData['is_default'] == 1) { ?>
                               <div class="form-group">
                                    <label class="col-lg-3 control-label"><?= lang('samaj_name') ?><span class="text-danger"> * </span></label>
                                    <div class="col-lg-9">
                                        <select name="samaj_id" id="samaj_id" data-init="1" data-placeholder="Select <?= lang('samaj_name') ?>" class="select">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-3 control-label"><?= lang('parent_gallery_name') ?></label>
                                    <div class="col-lg-9">
                                        <select data-placeholder="Select <?= lang('parent_gallery_name') ?>"
                                                name="parent_gallery_id" id="parent_gallery_id">
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>

                            <?php } ?>
                            <!-- Gallery Name -->
                            <div class="form-group">
                                <label class="col-lg-3 control-label"><?= lang('gallery_name') ?><span class="text-danger"> * </span></label>
                                <div class="col-lg-9">
                                    <input type="text" name="gallery_name[]"
                                           value="<?= (isset($getDescGalleryData[$languageData['language_id']]['gallery_name']) && ($getDescGalleryData[$languageData['language_id']]['gallery_name'] != '')) ? $getDescGalleryData[$languageData['language_id']]['gallery_name'] : ''; ?>"
                                           id="gallery_name_<?= $languageData['language_id']; ?>" class="form-control"
                                           placeholder="Enter <?= lang('gallery_name') ?>">
                                </div>
                            </div>
                            <?php if ($languageData['is_default'] == 1) { ?>
                                <!-- filename -->
                                <div class="form-group">
                                    <label class="col-lg-3 control-label"><?= lang('filename') ?></label>
                                    <div class="col-lg-9">
                                        <input type="file" accept="image/*" name="filename[]" id="filename" class="file-styled-primary"
                                               multiple>
                                        <!--                <img width="100" height="100">-->
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-3 control-label"></label>
                                    <div class="col-lg-9">
                                        <div class="form-group" id="imageListing">

                                        </div>
                                    </div>
                                </div>
                            <?php }
                            ?>
                        </div>
                    <?php }
                }?>
            </div>
        </div>



        <!-- parent gallery -->

        
        <!-- create reset button-->
        <div class="text-right">
            <button type="button" class="btn btn-xs border-slate text-slate btn-flat cancel"
                    onclick="window.location.href='<?php echo site_url('Gallery'); ?>'"><?= lang('cancel_btn') ?> <i class="icon-cross2 position-right"></i> </button>

            <button type="submit"
                    class="btn btn-xs border-blue text-blue btn-flat btn-ladda btn-ladda-progress submit"
                    data-spinner-color="#03A9F4" data-style="fade"><span
                        class="ladda-label"><?= lang('submit_btn') ?></span>
                <i id="icon-hide" class="icon-arrow-right8 position-right"></i>
            </button>

        </div>
        <?php echo form_close(); ?>
    </div>
</div>

<!--image edit time image load and display-->
<script>


    function ImageLoad() {
        var galleryId = $('#gallery_id').val();

        $.ajax({
            type: "POST",
            url: "<?php echo site_url('Gallery/imageLoad');?>",
            dataType: "json",
            async: false,
            data: {galleryId: galleryId},
            beforeSend: function (formData, jqForm, options) {
//                var dialog = bootbox.dialog({
//                    message: 'Please have patience, images are loading',
//                });
            },
            complete: function () {
                // bootbox.hideAll();
            },
            success: function (resObj) {
                $('#imageListing').html(resObj);
            }
        });
    }


    function deleteImage(imageId, imageUrl) {

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
                    type: "POST",
                    url: "<?php echo site_url('Gallery/imageDelete');?>",
                    dataType: "json",
                    //async: false,
                    data: {imageId: imageId, imageUrl: imageUrl},
                    success: function (data) {
                        if (data['success']) {
                            swal({
                                title: "<?= ucwords(lang('success'))?>",
                                text: data['msg'],
                                type: "<?= lang('success')?>",
                                confirmButtonColor: "<?= BTN_SUCCESS; ?>",
                            }, function () {
                                ImageLoad();
                            });
                        } else {
                            swal({
                                title: "<?= ucwords(lang('error')); ?>",
                                text: data['msg'],
                                type: "<?= lang('error'); ?>",
                                confirmButtonColor: "<?= BTN_ERROR; ?>"
                            }, function () {
                                //ImageLoad();
                            });
                        }
                    }


                });
            });
    }

</script>

<!-- end image edit time image load and display-->

<script>
    var laddaSubmitBtn = Ladda.create(document.querySelector('.submit'));

    $(document).ready(function () {
        // Full featured editor
//        CKEDITOR.replace( 'content', {
//            height: '400px',
//            extraPlugins: 'forms'
//        });
        FileValidate();
        FileKeyGen();
        Select2Init();
        galleryDD('','#parent_gallery_id');
		samajDD('', '#samaj_id');
        Select2TagsInit();

        $.validator.addMethod('filesize', function (value, element, param) {
            return this.optional(element) || (element.files[0].size <= param)
        });
        // Initialize
        var validator = $("#galleryDetails").validate({
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
                samaj_id: {
                    required: true,
                },
                'gallery_name[]': {
                     required: true,
                },
                "filename[]": {
                    extension: "<?= FILE_UPLOAD_TYPE ?>",
                    filesize: "<?= MAX_IMAGE_SIZE_LIMIT ?>"
                },

            },
            messages: {
                samaj_id:{
                    required: "Please Select <?= lang('samaj')?>",
                },
                'gallery_name[]': {
                    required: "Please Enter <?= lang('gallery_name') ?>",
                    //remote  : "<?//= lang('gallery_name') ?>// Already Exist",
                },
                "filename[]":{
                    extension: "Please choose image with extension <?= FILE_UPLOAD_TYPE_MSG ?>",
                    filesize: "File size is more than  expected size (2MB) "
                },

            },
            submitHandler: function (e) {
                $('textarea.ckeditor').each(function () {
                    var $textarea = $(this);
                    $textarea.val(CKEDITOR.instances[$textarea.attr('name')].getData());
                });

                $(e).ajaxSubmit({
                    url: '<?php echo site_url("Gallery/save");?>',
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
                                window.location.href = '<?php echo site_url('Gallery');?>';
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
        ImageLoad();
        <?php if((isset($getGalleryData['parent_gallery_id']) && $getGalleryData['parent_gallery_id'] != 0)){
        $getGallery = $getGalleryData['parent_gallery_name'];
        ?>
        var option = new Option("<?= $getGalleryData['parent_gallery_name']; ?>", "<?= $getGalleryData['parent_gallery_id']; ?>", true, true);
        $('#parent_gallery_id').append(option).trigger('change');
//        galleryDD('<?//= $getGalleryData['parent_gallery_id'] ?>//','#parent_gallery_id');
        <?php } ?>


        <?php if((isset($getGalleryData['samaj_name']) && !empty($getGalleryData['samaj_name']))){
        $samajName = $getGalleryData['samaj_name']; ?>
        var option = new Option("<?= $getGalleryData['samaj_name']; ?>", "<?= $getGalleryData['samaj_id']; ?>", true, true);
        $('#samaj_id').append(option).trigger('change');
        <?php } ?>


    });




</script>
<?php if(isset($select2)){ ?>

<?= $select2 ?>

<?php } ?>

