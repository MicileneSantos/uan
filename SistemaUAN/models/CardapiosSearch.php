<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Cardapio;
use mPDF;
use kartik\mpdf\Pdf;

/**
 * CardapiosSearch represents the model behind the search form of `app\models\Cardapio`.
 */
class CardapiosSearch extends Cardapio
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['descricao'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Cardapio::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                    'defaultOrder' => [
                    'nome' => SORT_DESC,
                    'nome' => SORT_ASC,
                ]
            ],
            'pagination' => [
                    'pageSize' => 10,
            ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'descricao' => $this->descricao,
        ]);

        /*$query->andFilterWhere(['like', 'data', $this->data])
            ->andFilterWhere(['like', 'categoria', $this->categoria]);*/

        return $dataProvider;
    }
}
