require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'Modelのテスト' do
    let(:cart) { create(:cart) }
    let(:user) { create(:user) }

    context 'バリテーションのテスト' do
      it 'user_idがあれば有効であること' do
        expect(cart).to be_valid
      end
      it 'user_idがなければ無効であること' do
        cart.user_id = nil
        expect(cart.valid?).to eq(false)
      end
    end
  end
end
