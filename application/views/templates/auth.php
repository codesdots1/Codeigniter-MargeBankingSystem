<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MARG TECH</title>

<!--    favicon ICON-->
<!--    <link rel="icon" href="--><?//= $assets ?><!--../../uploads/logo.png" type="image/png" sizes="16x16">-->

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
    <link href="<?= $assets ?>css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
    <link href="<?= $assets ?>css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">
    <link href="<?= $assets ?>css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="<?= $assets ?>css/core.css" rel="stylesheet" type="text/css">
    <link href="<?= $assets ?>css/components.css" rel="stylesheet" type="text/css">
    <link href="<?= $assets ?>css/colors.css" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->

    <!-- Core JS files -->
    <script type="text/javascript" src="<?= $assets ?>js/plugins/loaders/pace.min.js"></script>
    <script type="text/javascript" src="<?= $assets ?>js/core/libraries/jquery.min.js"></script>
    <script type="text/javascript" src="<?= $assets ?>js/core/libraries/bootstrap.min.js"></script>

    <!-- /core JS files -->

    <!-- Theme JS files -->
    <script type="text/javascript" src="<?= $assets ?>js/core/app.js"></script>
    <script type="text/javascript" src="<?= $assets ?>js/plugins/ui/ripple.min.js"></script>
    <!-- /theme JS files -->


</head>
<script>
    $.ajaxSetup({
        data: { <?= $this->security->get_csrf_token_name() ?>:'<?= $this->security->get_csrf_hash() ?>'
    }
    });
</script>

<body class="login-container">

<!-- Main navbar -->
<div class="navbar navbar-inverse">
    <div class="navbar-header">
<!--        <a class="navbar-brand" href="index.html"><img src="--><?//= $assets ?><!--images/logo_light.png" alt=""></a>-->
        <a class="navbar-brand" href="<?= base_url();?>">MARG TECH</a>

        <ul class="nav navbar-nav visible-xs-block">
            <li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
            <li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
        </ul>
    </div>

    <div class="navbar-collapse collapse " id="navbar-mobile">


    </div>
</div>
<!-- /main navbar -->

<!-- Page container -->
<div class="page-container">

    <!-- Page content -->
    <div class="page-content">

        <!-- Main content -->
        <div class="content-wrapper">
            <!-- Content area -->
            <div class="content">

            <?php echo $body;?>
            <!-- /advanced login -->

            <!-- Footer -->
            <div class="footer text-muted text-center">
                &copy; <?php echo date('Y');?>  <a href="#" target="_blank">MARG TECH</a>

            </div>
            <!-- /footer -->
            </div>
        </div>

        <!-- /main content -->

    </div>
    <!-- /page content -->

</div>

<!-- /page container -->


<?php
if(isset($extra_js)){
    foreach ($extra_js as $js){
        echo '<script src="'.$assets.$js.'"></script>';
        echo "\n";
    }
}
?>


</body>
<script>
    function Select2Init() {
        $('.select').each(function () {
            var select = $(this);
            $("#" + select.attr('id')).select2({}).on('change.select2', function () {
                if ($("#" + select.attr('id')).valid()) {
                    $("#" + select.attr('id')).removeClass('invalid').addClass('success');
                }
            });
        });
    }
</script>
</html>
