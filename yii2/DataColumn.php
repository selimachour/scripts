<?php

namespace common\components;

class DataColumn extends \yii\grid\DataColumn {


    /**
     * Adds a class="data-User data-email" to describe the data
     */
    public function renderDataCell($model, $key, $index)
    {
        // add cell attribute name to td class
        if (is_object($model))
            $cls = 'data-' . ucfirst($model::tableName()) . ' data-' . $this->attribute;
        else
            $cls = 'data-' . $this->attribute;

        
        if (empty($this->contentOptions['class']))
            $this->contentOptions = ['class' => $cls];


        return parent::renderDataCell($model, $key, $index);
    }

}