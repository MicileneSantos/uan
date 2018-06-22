<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RefeicaoPrato */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="refeicao-prato-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'prato_id')->textInput() ?>

    <?= $form->field($model, 'refeicao_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
