require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  describe 'HTTPリクエスト /URL' do
    let(:purchase) { create(:purchase) }
    let(:user) { create(:user) }
    let(:order) { create(:order) }
    let(:item) { create(:item) }

    before do
      sign_in user
    end

    context 'レスポンスが成功していること' do
      it 'index.html.erb' do
        get purchases_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'new.html.erb' do
        get new_purchase_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
    end

    context '@purchaseが取得できていること' do
      it 'index.html.erb' do
        get purchases_path
        expect(response.body).to include purchase.total_amount
      end
    end
  end
end
