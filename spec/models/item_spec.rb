require 'rails_helper'

describe Item do
  describe '#create' do


    # #まず全項目入力ありでOKの確認
    it "全項目が入力されていれば出品できる" do
      item = build(:item)
      expect(item).to be_valid
    end


    # #「商品画像」に関するvalidテスト（最大10枚まで）
    # it "画像なしでは、出品できない" do
    # it "画像が1枚あれば、エラーは出ない（=画像があればOK）" do
    # it "画像が2枚でも、エラーは出ない（=画像複数枚で登録OK）" do
    # it "画像が10枚であれば、エラーは出ない（=画像10枚までOK）" do
    # it "画像が11枚では、出品できない（=画像10枚超はNG）" do


    #「商品名」に関するvalidテスト（40文字まで）
    it "商品名が空では、出品できない" do
      item = build(:item, item_name: nil)
      item.valid?
      expect(item.errors[:item_name]).to include("を入力してください")
    end
    # it "商品名が1文字あれば、エラーは出ない（=入力があれば）" do
    # end    #これは不要（全項目の入力で登録できることで確認可能）
    it "商品名が40文字であれば、エラーは出ない（=40文字までOK）" do
      item = build(:item, item_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end
    it "商品名が41文字では、出品できない（=40文字超はNG）" do
      item = build(:item, item_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:item_name]).to include("は40文字以内で入力してください")
    end


    #「商品の説明」に関するvalidテスト（1000文字以内）
    it "商品の説明が空では、出品できない" do
      item = build(:item, item_text: nil)
      item.valid?
      expect(item.errors[:item_text]).to include("を入力してください")
    end
    # it "商品の説明が1文字あれば、エラーは出ない（=入力があればOK）" do
    # end    #これは不要（全項目の入力で登録できることで確認可能）
    it "商品の説明が1000文字であれば、エラーは出ない（=1000文字までOK）" do
      item = build(:item, item_text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      expect(item).to be_valid
    end
    it "商品の説明が1001文字では、出品できない（=1000文字超はNG）" do
      item = build(:item, item_text: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:item_text]).to include("は1000文字以内で入力してください")
    end


    #「カテゴリ」に関するvalidテスト
    it "カテゴリ小項目が未選択では、出品できない" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end


    #「ブランド」に関するvalidテスト
    it "ブランド情報は空でも、エラーは出ない" do
      item = build(:item, brand: "")
      expect(item).to be_valid
    end


    #「商品の状態」に関するvalidテスト
    it "商品の状態の情報が未選択では、出品できない" do
      item = build(:item, item_status: "")
      item.valid?
      expect(item.errors[:item_status]).to include("を入力してください")
    end


    #「配送料の負担」に関するvalidテスト
    it "配送料の負担の情報が未選択では、出品できない" do
      item = build(:item, delivery_charge: "")
      item.valid?
      expect(item.errors[:delivery_charge]).to include("を入力してください")
    end


    #「発送元地域」に関するvalidテスト
    it "発送元の地域の情報が未選択では、出品できない" do
      item = build(:item, delivery_area: "")
      item.valid?
      expect(item.errors[:delivery_area]).to include("を入力してください")
    end


    #「発送までの日数」に関するvalidテスト
    it "発送までの日数の情報が未選択では、出品できない" do
      item = build(:item, delivery_day: "")
      item.valid?
      expect(item.errors[:delivery_day]).to include("を入力してください")
    end


    #「販売価格」に関するvalidテスト（300円以上、1000万円未満）
    it "販売価格が空では、出品できない" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    it "販売価格の入力が数値以外では、出品できない（=数値のみ）" do
      item = build(:item, price: "a")
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end
    it "販売価格が299円では、出品できない（=300円未満はNG）" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end
    # it "販売価格が300円であれば、エラーは出ない（=300円以上）" do
    # end    #これは不要（全項目の入力で登録できることで確認可能）
    it "販売価格が9,999,999円であれば、エラーは出ない（=1000万円未満）" do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end
    it "販売価格が10,000,000円では、出品できない（=1000万円以上はNG）" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end

  end
end


