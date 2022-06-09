require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Modelのテスト' do
    let(:purchase) { create(:purchase) }
    let(:user) { create(:user) }

    context 'バリテーションのテスト' do
      it 'user_id, total_amountがあれば有効であること' do
        expect(purchase).to be_valid
      end
      it 'user_idがなければ無効であること' do
        purchase.user_id = nil
        expect(purchase.valid?).to eq(false)
      end
      it 'total_amountがなければ無効であること' do
        purchase.total_amount = nil
        expect(purchase.valid?).to eq(false)
      end
    end
  end
end
