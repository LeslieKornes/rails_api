require 'rails_helper'

RSpec.describe ArticlesController do
  describe '#index' do
    it 'returns a success response' do
      get '/articles'
      expect(response).to have_http_status(:ok)
      # same as expect(response.status).to eq(200)
    end

    it 'returns proper JSON' do
      article = create(:article)
      get '/articles'
      body = JSON.parse(response.body).deep_symbolize_keys
      pp body
      expect(body).to eq(
        data: [
          {
            id: article.id.to_s, 
            type: 'articles', 
            attributes: {
              title: article.title,
              content: article.content, 
              slug: article.slug
            }
          }
        ]
      )
    end
  end
end