require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'Modelのテスト' do
    let(:favorite) { create(:favorite) }
    let(:user) { create(:user) }
    let(:product) { create(:product) }

    context 'バリテーションのテスト' do
      it 'user_id, product_idがあれば有効であること' do
        expect(favorite).to be_valid
      end
      it 'user_idがなければ無効であること' do
        favorite.user_id = nil
        expect(favorite.valid?).to eq(false)
      end
      it 'product_idがなければ無効であること' do
        favorite.product_id = nil
        expect(favorite.valid?).to eq(false)
      end
    end
  end
end
