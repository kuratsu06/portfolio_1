require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Modelのテスト' do
    let(:item) { create(:item) }
    let(:product) { create(:product) }
    let(:cart) { create(:cart) }

    context 'バリテーションのテスト' do
      it 'product_id, cart_id, quantityがあれば有効であること' do
        expect(item).to be_valid
      end
      it 'product_idがなければ無効であること' do
        item.product_id = nil
        expect(item.valid?).to eq(false)
      end
      it 'cart_idがなければ無効であること' do
        item.cart_id = nil
        expect(item.valid?).to eq(false)
      end
      it 'quantityがなければ無効であること' do
        item.quantity = nil
        expect(item.valid?).to eq(false)
      end
    end
  end
end
