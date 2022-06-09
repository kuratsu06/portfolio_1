require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe 'HTTPリクエスト /URL' do
    let(:cart) { create(:cart) }
    let(:user) { create(:user) }
    let(:item) { create(:item) }

    context 'レスポンスが成功していること' do
      it 'show.html.erb' do
        get my_cart_path(cart)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
    end

    context '@cartが取得できていること' do
      it 'show.html.erb' do
        get my_cart_path(cart)
        expect(response.body).to include item.product.name
      end
    end
  end
end
