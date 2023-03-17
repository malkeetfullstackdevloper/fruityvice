<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\commands;

use yii\console\Controller;
use yii\console\ExitCode;
use Yii;
use yii\db\Query;

/**
 * This command echoes the first argument that you have entered.
 *
 * This command is provided as an example for you to learn how to create console commands.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class HelloController extends Controller
{
    /**
     * This command echoes what you have entered as the message.
     * @param string $message the message to be echoed.
     * @return int Exit code
     */
    public function actionIndex($message = 'hello world')
    {

        $query = new Query;
        $query->select('*')->from('tblfruits');
        $rows = $query->count();

        if ($rows>0) {
            Yii::$app->db->createCommand()
            ->delete('tblfruits')
            ->execute();

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL,'https://fruityvice.com/api/fruit/all');
            curl_setopt( $ch, CURLOPT_CUSTOMREQUEST, 'GET' );
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $response = curl_exec($ch);
            $result = json_decode($response);
            curl_close($ch);

            foreach ($result as $key => $value) {
                Yii::$app->db->createCommand()
                ->insert('tblfruits', [
                    'genus' => $value->genus,
                    'name' => $value->name,
                    'fruitsid' => $value->id,
                    'family' => $value->family,
                    'order' => $value->order,
                    'carbohydrates' => $value->nutritions->carbohydrates,
                    'protein' => $value->nutritions->protein,
                    'fat' => $value->nutritions->fat,
                    'calories' => $value->nutritions->calories,
                    'sugar' => $value->nutritions->sugar,
                ])->execute();
            }
            
        }

        echo 'Data inserted' . "\n";

        return ExitCode::OK;
    }
}
