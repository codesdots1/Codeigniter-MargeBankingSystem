<!--<script src='https://www.google.com/recaptcha/api.js'></script>-->
<div class="content">
    <?php
    if ($message != '') { ?>
        <div class="alert alert-warning alert-bordered">
            <button type="button" class="close" data-dismiss="alert"><span>&times;</span><span
                        class="sr-only">Close</span></button>
            <span class="text-semibold"><?= $message ?>

        </div>
    <?php } ?>


    <?php
    $form_id = array(
        'id' => 'loginfrm',
        'method' => 'post',
        'class' => 'form-horizontal'
    );


    echo form_open("auth/login", $form_id); ?>
    <div class="panel panel-body login-form">
        <div class="text-center">
            <div class="icon-object border-slate-300 text-slate-300"><i class="icon-reading"></i></div>
            <h5 class="content-group"><?php echo lang('login_heading'); ?> to your account

            </h5>
        </div>

<!--		<div class="form-group">-->
<!--			<label class="col-lg-3 control-label">--><?//= lang('branch_name') ?><!--<span class="text-danger"> * </span></label>-->
<!--			<div class="col-lg-9">-->
<!--				<select name="branch_id" id="branch_id" class="form-control" data-placeholder="Select --><?//= lang('branch_name') ?><!-- ">-->
<!--					<option value=""></option>-->
<!--				</select>-->
<!--			</div>-->
<!--		</div>-->


		<div class="form-group has-feedback has-feedback-left">
            <input type="email" class="form-control" id="inputEmail" name="identity" required placeholder="Username">
            <div class="form-control-feedback">
                <i class="icon-user text-muted"></i>
            </div>
        </div>

        <div class="form-group has-feedback has-feedback-left">
            <input type="password" class="form-control" id="inputPassword" name="password" required
                   placeholder="Password">
            <div class="form-control-feedback">
                <i class="icon-lock2 text-muted"></i>
            </div>
        </div>

<!--        <div class="form-group has-feedback has-feedback-left">-->
<!--            <div class="g-recaptcha" class="form-control"-->
<!--                 data-sitekey="$this->config->item("recaptcha_site_key") ></div>-->
<!--            <label id="g-recaptcha-response-error" class="validation-error-label" for="g-recaptcha-response"></label>-->
<!--        </div>-->

        <div class="form-group login-options">
            <div class="row">
                <div class="col-sm-4">
                    <label class="checkbox-inline">
                        <input type="checkbox" class="styled" id="remember" name="remember"
                               value="1"><?php echo lang('login_remember_label', 'remember'); ?></label>
                </div>

                <div class="col-sm-8 text-right">
                    <label class="checkbox-inline">
                    <a href="<?php echo base_url('Auth/forgot_password') ?>"><?php echo lang('login_forgot_password'); ?></a>
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="btn bg-pink-400 btn-block"><?php echo lang('login_submit_btn') ?></button>
        </div>

    </div>
</div>
<?php echo form_close(); ?>

<script>
    $(document).ready(function () {

        var validator = $("#loginfrm").validate({
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
                identity: {
                    required: true,
                },
                password: {
                    required: true,
                },
                'g-recaptcha-response': {
                    required: true
                }
            },
            messages: {
                identity: {
                    required: "Please Enter <?= lang('identity') ?>",
                },
                password: {
                    required: "Please Enter <?= lang('password') ?>"
                },
                'g-recaptcha-response': {
                    required: '<?=lang('captcha_challenge') ?>',
                }
            },
            submitHandler: function (form) {
                form.submit();
            }
        });
    });
</script>
<?php if (isset($select2)) { ?>
	<?= $select2 ?>
<?php } ?>
