<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Sugestões';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-contact">
   
    <?php if (Yii::$app->session->hasFlash('contactFormSubmitted')): ?>

        <div class="alert alert-success">
            Thank you for contacting us. We will respond to you as soon as possible.
        </div>

        <p>
            Note that if you turn on the Yii debugger, you should be able
            to view the mail message on the mail panel of the debugger.
            <?php if (Yii::$app->mailer->useFileTransport): ?>
                Because the application is in development mode, the email is not sent but saved as
                a file under <code><?= Yii::getAlias(Yii::$app->mailer->fileTransportPath) ?></code>.
                Please configure the <code>useFileTransport</code> property of the <code>mail</code>
                application component to be false to enable email sending.
            <?php endif; ?>
        </p>

    <?php else: ?>
    <div class="box box-primary">
        
        <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>
            <div class="box-header with-border">
                <h4>Deixe sua sugestão aqui!</h4>
                <div class="box-body">
                    <div class="row">
                        <div class="col-lg-5">               
                            <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>

                            <?= $form->field($model, 'email') ?>

                            <?= $form->field($model, 'subject') ?>

                            <?= $form->field($model, 'body')->textarea(['rows' => 6]) ?>

                            <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                                    'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
                            ]) ?>

                                <div class="form-group">
                                    <?= Html::submitButton('Enviar', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php ActiveForm::end(); ?>
    </div>
    <?php endif; ?>
</div>
