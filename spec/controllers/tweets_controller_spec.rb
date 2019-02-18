require "rails_helper"
describe TweetsController do
  describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{|a, b| b.created_at <=> a.created_at})
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
