require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe 'HTTPリクエスト /URL' do
    let(:review) { create(:review) }
    let(:user) { create(:user) }
    let(:product) { create(:product) }

    before do
      sign_in user
    end

    context 'レスポンスが成功していること' do
      it 'index.html.erb' do
        get reviews_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
      it 'new.html.erb' do
        get new_review_path
        expect(response).to have_http_status(200)
        expect(response).to have_http_status(:success)
      end
    end

    context '@reviewが取得できていること' do
      it 'index.html.erb' do
        get reviews_path
        expect(response.body).to include review.comment
      end
    end
  end
end
