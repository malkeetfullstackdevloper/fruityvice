<?php

/** @var yii\web\View $this */

use yii\widgets\LinkPager;


$this->title = 'Favorite List';
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
                    <th>Fruit Name</th>
                    <th>Fruit Family</th>
                    <th>Sum of nutritions</th>
                </tr>
            </thead>        
            <tbody>
                <?php foreach ($models as $model) { ?>
                    <tr>
                        <td><?=$model['fname']?></td>
                        <td><?=$model['ffamily']?></td>
                        <td><?=$model['fsumofnutritions']?></td>
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

    </div>

</div>
