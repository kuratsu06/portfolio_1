require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'Modelのテスト' do
    let(:review) { create(:review) }
    let(:user) { create(:user) }
    let(:product) { create(:product) }

    context 'バリテーションのテスト' do
      it 'user_id, product_id, commentがあれば有効であること' do
        expect(review).to be_valid
      end
      it 'user_idがなければ無効であること' do
        review.user_id = nil
        expect(review.valid?).to eq(false)
      end
      it 'product_idがなければ無効であること' do
        review.product_id = nil
        expect(review.valid?).to eq(false)
      end
      it 'ccommentがなければ無効であること' do
        review.comment = nil
        expect(review.valid?).to eq(false)
      end
    end
  end
end
