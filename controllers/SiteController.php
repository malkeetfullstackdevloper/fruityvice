<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use yii\db\Query;
use yii\data\Pagination;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {

        $query = new Query;
        $query->select('*')->from('tblfruits')->all();

        $countQuery = clone $query;
        $pages = new Pagination(['totalCount' => $countQuery->count()]);
        $models = $query->offset($pages->offset)
            ->limit(10)
            ->all();

        return $this->render('index', [
            'models' => $models,
            'pages' => $pages,
        ]);

    }

    /**
     * Add to fav action.
     *
     * @return Response|string
     */
    public function actionAddtofav()
    {
        if (Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $uid = Yii::$app->user->id;
        $fid = Yii::$app->request->post('fruitid'); //tblfavorites
        $fname = Yii::$app->request->post('fname'); //tblfavorites
        $ffamily = Yii::$app->request->post('ffamily'); //tblfavorites
        $fsumofnutritions = Yii::$app->request->post('fsumofnutritions'); //tblfavorites

        $query = new Query;
        $data = $query->select('*')->from('tblfavorites')->where(['uid' => $uid])->where(['fid' => $fid])->count();
        $datattl = $query->select('*')->from('tblfavorites')->where(['uid' => $uid])->count();

        //echo $data;

        if ($datattl != 10) {
            if ($data == 0) {
                Yii::$app->db->createCommand()
                    ->insert('tblfavorites', [
                        'uid' => $uid,
                        'fid' => $fid,
                        'fname' => $fname,
                        'ffamily' => $ffamily,
                        'fsumofnutritions' => $fsumofnutritions,
                    ])->execute();

                echo "Fruit added your favorite list."; die;
            }else{
                echo 'Already added!'; die;
            }
        }else{
            echo 'Sorry, You can add only 10 fruits in your favorite list!';
        }

    }


    /**
     * fav list action.
     *
     * @return Response|string
     */
    public function actionMyfav()
    {
        $query = new Query;
        $query->select('*')->from('tblfavorites')->all();

        $countQuery = clone $query;
        $pages = new Pagination(['totalCount' => $countQuery->count()]);
        $models = $query->offset($pages->offset)
            ->limit(10)
            ->all();

        return $this->render('myfav', [
            'models' => $models,
            'pages' => $pages,
        ]);

    }


    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
}
