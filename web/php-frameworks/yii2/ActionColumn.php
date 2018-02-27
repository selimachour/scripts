<?php

namespace common\components;

use Yii;
use yii\helpers\Html;

class ActionColumn extends \yii\grid\ActionColumn {


    /**
     * Set to true to open view actions in a modal box
     */
    public $ajax = false;

    public $headerOptions  = ['class' => 'actionColumn'];
    public $contentOptions = ['class' => 'actionColumn'];

    public $header;

    private $_buttons;
    private $_defaultTemplate;
    public $editable;
    public $deletable;


    /**
     * @inheritdoc
     */
    public function init()
    {
        $this->header = \Yii::t('app', 'Actions');
        $this->_defaultTemplate = $this->template;


        if ($this->ajax)
            $this->buttons['view'] = function ($url, $model, $key) {
                return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                    'title' => Yii::t('yii', 'View'),
                    'data-pjax' => '0',
                    'data-toggle'=>'ajaxmodal', 
                    'data-target'=>'#myModal',
                    'class'=>'ajaxmodal',
                ]);
            };
        
        parent::init();

        $this->_buttons = $this->buttons;
    }

    protected function renderDataCellContent($model, $key, $index)
    {
        $this->template = $this->_defaultTemplate;
        if (isset($this->editable))
        {
            if (!call_user_func($this->editable, $model))
                $this->template = str_replace('{update}', '<span class="notallowed">{update}</span>', $this->template);
        }
        if (isset($this->deletable))
        {
            if (!call_user_func($this->deletable, $model))
                $this->template = str_replace('{delete}', '<span class="notallowed">{delete}</span>', $this->template);
        }

        return parent::renderDataCellContent($model, $key, $index);
    }
}