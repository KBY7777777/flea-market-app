#出品商品編集機能（edit/updateアクション）のテストケース

require 'rails_helper'

describe ItemsController, type: :controller do

  #動作確認のため、sellアクション（newアクション相当）もテストしてみる
  describe 'GET #sell' do
    it 'sellアクション（newアクション相当）の画面に遷移すること' do
      get :sell
      expect(response).to render_template :sell
    end
  end

  #editアクションのテストケース（一旦こちらを準備）
  describe 'GET #edit' do

    it "インスタンス変数@itemの値を確かめる" do
      item = create(:item)    #itemレコードをcreateで生成
      @grandchild_category = item.category_id    #itemレコードにセットされるcategory_idは孫階層のもの
      get :edit, params: { id: item }
      expect(assigns(:item)).to eq item
    end

    it "editアクションのリクエスト後、items/edit.html.hamlに遷移すること" do
      item = create(:item)
      get :edit, params: { id: item }
      expect(response).to render_template :edit
    end
  end

end


