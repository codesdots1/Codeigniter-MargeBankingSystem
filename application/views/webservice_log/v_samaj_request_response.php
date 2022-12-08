<div class="row">
    <div class="col-md-12">
        <div class="panel panel-flat">
            <div class="panel-body">

                <div class="tabbable">
                    <ul class="nav nav-tabs">
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Request <span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li class="active"><a href="#basic-tab1_<?php echo $logId ;?>"  data-toggle="tab"> Json </a></li>
                                <li><a href="#basic-tab2_<?php echo $logId ;?>"  data-toggle="tab"> Php array </a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Response <span class="caret"></span></a>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <li><a href="#basic-tab3_<?php echo $logId ;?>" data-toggle="tab"> Json </a></li>
                                <li><a href="#basic-tab4_<?php echo $logId ;?>" data-toggle="tab"> Php array </a></li>
                            </ul>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="basic-tab1_<?php echo $logId ;?>">
                            <?= $logData['params'];?>
                        </div>

                        <div class="tab-pane" id="basic-tab2_<?php echo $logId ;?>">
                            <?php $arrayData = json_decode($logData['params'], TRUE);
                            printArray($arrayData);
                            ?>
                        </div>

                        <div class="tab-pane" id="basic-tab3_<?php echo $logId ;?>">
                            <?= $logData['response'];?>
                        </div>

                        <div class="tab-pane" id="basic-tab4_<?php echo $logId ;?>">
                            <?php $arrayData = json_decode($logData['response'], TRUE);
                            printArray($arrayData);
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>