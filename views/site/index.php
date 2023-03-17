<?php

/** @var yii\web\View $this */

use yii\widgets\LinkPager;


$this->title = 'Fruits Data';
?>

<style type="text/css">
    .pagination li {padding: 2px 8px; border: 1px solid #333; }
</style>

<div class="site-index">

    <div class="jumbotron text-center bg-transparent">
        <h1 class="display-4">fruityvice.com all data!</h1>

        <table class="table table-responsive">
            <thead>
                <tr>
                    <th>Genus</th>
                    <th>Name</th>
                    <th>Family</th>
                    <th>Order</th>
                    <th>Action</th>
                </tr>
            </thead>        
            <tbody>
                <?php foreach ($models as $model) { ?>
                    <tr>
                        <td><?=$model['genus']?></td>
                        <td><?=$model['name']?></td>
                        <td><?=$model['family']?></td>
                        <td><?=$model['order']?></td>
                        <td><span onclick="addtofav(<?=$model['id']?>,'<?=$model['name']?>','<?=$model['family']?>',<?=$model['carbohydrates']+$model['protein']+$model['fat']+$model['calories']+$model['sugar']?>)"> Add to favorite </span></td>
                    </tr>
                <?php } ?>

            </tbody>
        </table>

        <div class="paginaltionyii">
            <?php 
                echo LinkPager::widget([
                    'pagination' => $pages,
                ]);
            ?>
        </div>

        <script type="text/javascript">
            function addtofav(fid,fname,ffamily,fsumofnutritions){
                $.ajax({
                    url: "index.php?r=site%2Faddtofav",
                    type: "post",
                    data: {fruitid:fid,fname:fname,ffamily:ffamily,fsumofnutritions:fsumofnutritions},
                    success: function (response) {
                        alert(response);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                       console.log(textStatus, errorThrown);
                    }
                });
            }
        </script>

    </div>

</div>
