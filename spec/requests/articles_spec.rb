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
      expect(json_data.length).to eq 1
      expected = json_data.first
      aggregate_failures do
        expect(expected[:id]).to eq(article.id.to_s)
        expect(expected[:type]).to eq('article')
        expect(expected[:attributes]).to eq(
          title: article.title,
          content: article.content, 
          slug: article.slug
        )
      end
    end

    it 'returns articles in the proper order' do
      # important to older article first bc expectation is based on _id_
      # maybe the wrong expectation? **update - added recent scope tested below
      older_article = create(:article, created_at: 1.hour.ago)
      newer_article = create(:article)
      get '/articles'
      ids = json_data.map { |d| d[:id].to_i }
      expect(ids).to eq([newer_article.id, older_article.id])
    end

    it 'paginates results' do
      article1, article2, article3 = create_list(:article, 3)
      get '/articles', params: { page: { number: 2, size: 1 } }
      expect(json_data.length).to eq(1)
      
      expect(json_data.first[:id]).to eq([article2.id])
    end

    it 'contains pagination links in the response' do
      article1, article2, article3 = create_list(:article, 3)
      get '/articles', params: { page: { number: 2, size: 1 } }
      expect(json['links'].length).to eq(5)
      expect(json['links'].keys).to contain_exactly(
        'first', 'prev', 'next', 'last', 'self'
      )
    end
  end
end