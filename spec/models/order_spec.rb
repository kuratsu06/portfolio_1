require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Modelのテスト' do
    let(:order) { create(:order) }
    let(:product) { create(:product) }
    let(:purchase) { create(:purchase) }

    context 'バリテーションのテスト' do
      it 'product_id, purchase_id, quantity, subtotalがあれば有効であること' do
        expect(order).to be_valid
      end
      it 'product_idがなければ無効であること' do
        order.product_id = nil
        expect(order.valid?).to eq(false)
      end
      it 'purchase_idがなければ無効であること' do
        order.purchase_id = nil
        expect(order.valid?).to eq(false)
      end
      it 'quantityがなければ無効であること' do
        order.quantity = nil
        expect(order.valid?).to eq(false)
      end
      it 'subtotalがなければ無効であること' do
        order.subtotal = nil
        expect(order.valid?).to eq(false)
      end
    end
  end
end
