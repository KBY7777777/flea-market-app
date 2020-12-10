#クレカ登録機能のモデル単体テストコード

require 'rails_helper'

describe Card do

  describe '#pay（create）' do

    it "必要なクレジットカード情報がすべて入力されれば登録できる" do
      user = create(:user)
      card = FactoryBot.build(:card, user_id: user[:id])
      expect(card).to be_valid
    end
   
    it "user_idがない場合は登録できない" do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user]).to include("を入力してください")
    end
    
    it "customer_idがない場合は登録できない" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
    
    it "payjp_idがない場合は登録できない" do
      card = build(:card, payjp_id: nil)
      card.valid?
      expect(card.errors[:payjp_id]).to include("を入力してください")
    end

  end

end


