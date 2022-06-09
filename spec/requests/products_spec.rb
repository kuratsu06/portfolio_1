require 'rails_helper'

RSpec.describe "products", type: :request do
  describe 'HTTPリクエスト /URL' do
    let(:product) { create(:product) }
    let(:category) { create(:category) }
    let(:image) { create(:image, product_id: product.id) }

    context 'レスポンスが成功していること' do
      it 'index.html.erb' do
        get products_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'new.html.erb' do
        sign_in admin
        get new_product_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'show.html.erb' do
        get product_path(product)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'edit.html.erb' do
        sign_in admin
        get edit_product_path(product)
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
    end

    context '@productが取得できていること' do
      it 'index.html.erb' do
        get products_path
        expect(response.body).to include product.name
        expect(response.body).to include product.price
        expect(response.body).to include product.description
      end
      it 'show.html.erb' do
        get product_path(product)
        expect(response.body).to include product.name
        expect(response.body).to include product.price
        expect(response.body).to include product.description
      end
      it 'edit.html.erb' do
        sign_in admin
        get edit_product_path(product)
        expect(response.body).to include product.name
        expect(response.body).to include product.price
        expect(response.body).to include product.description
      end
    end
  end
end
