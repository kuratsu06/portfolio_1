require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Modelのテスト' do
    let(:user) { create(:user) }

    context 'バリテーションのテスト' do
      it 'name, address, phone, email, passwordがあれば有効であること' do
        expect(user).to be_valid
      end
      it 'nameがなければ無効であること' do
        user.name = nil
        expect(user.valid?).to eq(false)
      end
      it 'addressがなければ無効であること' do
        user.address = nil
        expect(user.valid?).to eq(false)
      end
      it 'phoneがなければ無効であること' do
        user.phone = nil
        expect(user.valid?).to eq(false)
      end
      it 'emailがなければ無効であること' do
        user.email = nil
        expect(user.valid?).to eq(false)
      end
      it 'passwordがなければ無効であること' do
        user.password = nil
        expect(user.valid?).to eq(false)
      end
    end
  end
end
