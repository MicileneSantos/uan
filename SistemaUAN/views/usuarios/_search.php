<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\UsuariosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="usuarios-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php // $form->field($model, 'id') ?>
    
    <div class="row">
        <div class="col-md-4"><?= $form->field($model, 'nome') ?></div>
        <div class="col-md-4"><?= $form->field($model, 'role')?></div>
        
    </div>

    <?php //=$form->field($model, 'email')  //$form->field($model, 'rua') ?>
    
    <?php //$form->field($model, 'cpf') ?>
    
    <?php //$form->field($model, 'rg') ?>

    <?php // echo $form->field($model, 'numero') ?>

    <?php // echo $form->field($model, 'complemento') ?>

    <?php // echo $form->field($model, 'bairro') ?>

    <?php // echo $form->field($model, 'cidade') ?>

    <?php // echo $form->field($model, 'estado') ?>

    <?php // echo $form->field($model, 'telefone') ?>

    <?php // echo $form->field($model, 'password_hash') ?>
    
    <?php // echo $form->field($model, 'isAtivo') ?>

    <?php // echo $form->field($model, 'codVerificacao') ?>

    <div class="form-group">
        <?= Html::submitButton('Buscar', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Limpar', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
