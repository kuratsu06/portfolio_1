require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Modelのテスト' do
    let(:category) { create(:category) }

    context 'バリテーションのテスト' do
      it 'nameがあれば有効であること' do
        expect(category).to be_valid
      end
      it 'nameがなければ無効であること' do
        category.name = nil
        expect(category.valid?).to eq(false)
      end
    end
  end
end
