#商品購入機能のモデル単体テストコード

require 'rails_helper'

describe Purchase do

  describe '#create' do

    it '必要情報がすべてあれば登録（購入）できる' do
      user = create(:user)
      purchase = build(:purchase, user_id: user.id)
      purchase.valid?
      expect(purchase).to be_valid
    end

    it 'item_idがない場合は登録（購入）できない' do
      user = create(:user)
      purchase = build(:purchase, user_id: user.id, item_id: nil)
      purchase.valid?
      expect(purchase.errors[:item_id]).to include("を入力してください")
    end

    it 'user_id（購入者情報）がない場合は登録（購入）できない' do
      user = create(:user)
      purchase = build(:purchase, user_id: nil)
      purchase.valid?
      expect(purchase.errors[:user_id]).to include("を入力してください")
    end

  end

end


