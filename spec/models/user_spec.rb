require 'rails_helper'

describe User do
  describe '#create' do

    it "全てのカラムの入力があれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknamがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "passwordが存在してもencrypted_passwordが空では登録できないこと" do
      user = build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include()
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "familyname_furiganaがない場合は登録できないこと" do
      user = build(:user, familyname_furigana: nil)
      user.valid?
      expect(user.errors[:familyname_furigana]).to include("を入力してください")
    end

    it "firstname_furiganaがない場合は登録できないこと" do
      user = build(:user, firstname_furigana: nil)
      user.valid?
      expect(user.errors[:firstname_furigana]).to include("を入力してください")
    end

    it "dateがない場合は登録できないこと" do
      user = build(:user, date: nil)
      user.valid?
      expect(user.errors[:date]).to include("を入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "0000000", encrypted_password: "0000000")
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "000000", encrypted_password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上に設定して下さい。")
    end

    it "family_nameが全角入力でなければ登録できないこと" do
      user = build(:user, family_name: "ﾔﾏﾀﾞ") 
      user.valid?
      expect(user.errors[:family_name]).to include("全角ひらがな、全角カタカナ、漢字のみが使用できます")
    end

    it "first_nameが全角入力でなければ登録できないこと" do
      user = build(:user, first_name: "ｱｲｳｴｵ")
      user.valid?
      expect(user.errors[:first_name]).to include("全角ひらがな、全角カタカナ、漢字のみが使用できます")
    end

    it "familyname_furiganaが全角カタカナでなければ登録できないこと" do
      user = build(:user, familyname_furigana: "あいうえお")
      user.valid?
      expect(user.errors[:familyname_furigana]).to include("全角カタカナのみが使用できます")
    end

    it "firstname_furiganaが全角カタカナでなければ登録できないこと" do
      user = build(:user, firstname_furigana: "あいうえお")
      user.valid?
      expect(user.errors[:firstname_furigana]).to include("全角カタカナのみが使用できます")
    end
    
  end
end



