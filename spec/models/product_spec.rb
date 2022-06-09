require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Modelのテスト' do
    let(:product) { create(:product) }
    let(:category) { create(:category) }
    let(:image) { create(:image, product_id: product.id) }

    context 'バリテーションのテスト' do
      it 'category_id, name, price, descriptionがあれば有効であること' do
        expect(product).to be_valid
      end
      it 'category_idがなければ無効であること' do
        product.category_id = nil
        expect(product.valid?).to eq(false)
      end
      it 'nameがなければ無効であること' do
        product.name = nil
        expect(product.valid?).to eq(false)
      end
      it 'priceがなければ無効であること' do
        product.price = nil
        expect(product.valid?).to eq(false)
      end
      it 'descriptionがなければ無効であること' do
        product.description = nil
        expect(product.valid?).to eq(false)
      end
      it "imageがなければ無効であること" do
        product.images = []
        expect(product.valid?).to eq(false)
      end
    end

    context "検索機能のテスト" do
      it "検索文字列に完全一致する結果を表示すること" do
        expect(Product.search("MyString")).to include(product)
      end
      it "検索文字列に部分一致する結果を表示すること" do
        expect(Product.search("M")).to include(product)
      end
      it "検索文字列が一致しない場合、何も表示しないこと" do
        expect(Product.search("あ")).to be_empty
      end
      it "検索文字列が空白の場合、全て表示すること" do
        expect(Product.search("")).to include(product)
      end
    end
  end
end
