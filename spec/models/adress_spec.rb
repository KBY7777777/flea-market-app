require 'rails_helper'

describe Address do
  describe '#create' do

    it "全てのカラムの入力があれば登録できる" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "destination_family_nameがない場合は登録できないこと" do
      address = build(:address, destination_family_name: nil)
      address.valid?
      expect(address.errors[:destination_family_name]).to include("全角ひらがな、全角カタカナ、漢字のみが使用できます", "を入力してください")
    end

    it "destination_first_nameがない場合は登録できないこと" do
      address = build(:address, destination_first_name: nil)
      address.valid?
      expect(address.errors[:destination_first_name]).to include("全角ひらがな、全角カタカナ、漢字のみが使用できます", "を入力してください")
    end

    it "destination_family_name_furiganaがない場合は登録できないこと" do
      address = build(:address, destination_family_name_furigana: nil)
      address.valid?
      expect(address.errors[:destination_family_name_furigana]).to include("全角カタカナのみが使用できます", "を入力してください")
    end

    it "destination_first_name_furiganaがない場合は登録できないこと" do
      address = build(:address, destination_first_name_furigana: nil)
      address.valid?
      expect(address.errors[:destination_first_name_furigana]).to include("全角カタカナのみが使用できます", "を入力してください")
    end

    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("ハイフン入り７桁で入力してください", "を入力してください")
    end

    it "prefectures_areaがない場合は登録できないこと" do
      address = build(:address, prefectures_area: nil)
      address.valid?
      expect(address.errors[:prefectures_area]).to include("を入力してください")
    end

    it "municipalityがない場合は登録できないこと" do
      address = build(:address, municipality: nil)
      address.valid?
      expect(address.errors[:municipality]).to include("を入力してください")
    end

    it "house_numberがない場合は登録できないこと" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

    #L96〜のケースと内容重複
    # it "telが半角数字でなければ登録できないこと" do
    #   address = build(:address, tel: "０００００００００００") 
    #   address.valid?
    #   expect(address.errors[:tel]).to include("半角数字のみが使用できます")
    # end

    it "destination_family_nameが全角入力でなければ登録できないこと" do
      address = build(:address, destination_family_name: "ｱｲｳｴｵ") 
      address.valid?
      expect(address.errors[:destination_family_name]).to include("全角ひらがな、全角カタカナ、漢字のみが使用できます")
    end

    it "destination_first_nameが全角入力でなければ登録できないこと" do
      address = build(:address, destination_first_name: "ｱｲｳｴｵ") 
      address.valid?
      expect(address.errors[:destination_first_name]).to include("全角ひらがな、全角カタカナ、漢字のみが使用できます")
    end

    it "destination_family_name_furiganaが全角カタカナでなければ登録できないこと" do
      address = build(:address, destination_family_name_furigana: "あいうえお")
      address.valid?
      expect(address.errors[:destination_family_name_furigana]).to include("全角カタカナのみが使用できます")
    end

    it "destination_first_name_furiganaが全角カタカナでなければ登録できないこと" do
      address = build(:address, destination_first_name_furigana: "あいうえお")
      address.valid?
      expect(address.errors[:destination_first_name_furigana]).to include("全角カタカナのみが使用できます")
    end

    it "postal_codeがハイフンあり7桁でなければ登録できないこと" do
      address = build(:address, postal_code: "1234567")
      address.valid?
      expect(address.errors[:postal_code]).to include("ハイフン入り７桁で入力してください")
    end

    it "telが半角数字でなければ登録できないこと" do
      address = build(:address, tel: "０１０００００００００")
      address.valid?
      expect(address.errors[:tel]).to include("半角数字のみが使用できます")
    end

    #追加
    it "telは空でも登録できる" do
      address = build(:address, tel: "")
      expect(address).to be_valid
    end

    #追加
    it "buildingは空でも登録できる" do
      address = build(:address, building: "")
      expect(address).to be_valid
    end

  end
end