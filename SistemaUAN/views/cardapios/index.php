<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
//use yii\widgets\Pjax;
use app\models\PratoCardapioSearch;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CardapiosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '';
//$this->params['breadcrumbs'][] = $this->title;
?>
<?php $form = ActiveForm::begin([
    'action' => Url::to(['cardapios/gerar']),
    'method' => 'get',
]);?>

<div class="pull-right">       
    <?= Html::a('<b class="fa fa-arrow-left"></b> Voltar', ['site/nutricionista'], ['class' => 'btn btn-default','title' => 'Voltar', 'id' => 'modal-btn-voltar'])?>
    <?= Html::a('<b class="fa fa-plus"></b> Novo', ['create'], ['class' => 'btn btn-success' ])?>
    <?= Html::a('<b class="fa fa-download"></b>', ['gerar'], ['target'=>'_blank','class' => 'btn btn-default','title' => 'Exportar', 'id' => 'modal-btn-pdf'])?>
</div>
<hr>
<div class="cardapios-index">

    <?php //Pjax::begin(['enablePushState' => false]);?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <div class="panel panel-success">
        
        
        <div class="panel-heading">
            <h5 class="panel-title">LISTA DE CARDÁPIOS CADASTRADOS</h5>
        </div>
        <div class="box box-success"></div>
            <div class="panel-body">
                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'summary' => "Exibindo {begin} - {end} de {totalCount} itens",
                    'columns' => [
                        //['class' => 'yii\grid\SerialColumn'],
                        [
                        'class' => 'kartik\grid\ExpandRowColumn',
                        //'width' => '50px','width' => '50px',
                        'value' => function ($model, $key, $index, $column) {
                            return GridView::ROW_COLLAPSED;
                        },
                        'detail' => function ($model, $key, $index, $column) {
                            $searchModel = new PratoCardapioSearch();
                            $searchModel->cardapio_id = $model->id;
                            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
                            
                            return Yii::$app->controller->renderPartial('_pratocardapio', [
                                'searchModel' => $searchModel,
                                'dataProvider' => $dataProvider,
                            ]);
                        },
                        //'headerOptions' => ['class' => 'kartik-sheet-style'] 
                        //'expandOneOnly' => true
                    ],
                        //'id',                   
                        [
                            'attribute' => 'categoria',
                            'headerOptions' => [
                                'style' => 'width: 200px;'
                            ]
                        ],
                        [ 
                            'label'=>'Data',
                            'format' => 'raw', 
                            'headerOptions' => [
                            'style' => 'width: 200px;'],
                            'value' => function ($model){
                                if ($model->data != null){
                                   return Yii::$app->formatter->asDate($model->data);
                                } else {
                                   return 'Não informado';
                                }
                            },                              
                        ],
                        
                        

                        [
                            'class' => 'kartik\grid\ActionColumn',
                            'header'=>'Ações',
                            'template' => '{view}{update}',
                            'buttons' => [
                                'view' => function($url, $model) {
                                    return Html::a('<span class="btn btn-success"><b class="fa fa-eye"></b></span>', ['view', 'id' => $model['id']], ['title' => 'Visualizar', 'id' => 'modal-btn-view']);
                                },
                                'update' => function($url, $model) {
                                    return Html::a('<span class="btn btn-warning"><b class="fa fa-pencil"></b></span>', ['update', 'id' => $model['id']], ['title' => 'Alterar', 'id' => 'modal-btn-view']);
                                },
                                'delete' => function($url, $model) {
                                    return Html::a('<span class="btn btn-danger"><b class="fa fa-trash"></b></span>', ['delete', 'id' => $model['id']], ['title' => 'Excluir', 'class' => '', 'data' => ['confirm' => 'Deseja excluir este cardápio?', 'method' => 'post', 'data-pjax' => false],]);
                                }
                            ]

                        ],
                                    
                    ],
                ]);
            ?>
        </div>
    </div>
</div>