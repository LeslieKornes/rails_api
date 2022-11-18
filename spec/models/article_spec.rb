# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { build(:article) }
  let(:article_2) { build(:article) }

  describe '#validations' do
    it 'tests that factory is valid' do
      expect(article).to be_valid
    end
  
    it 'has a required title' do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'has a required slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'has a required content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'validates uniqueness of the slug' do
      a = create(:article, slug: 'the-slug')
      expect(a).to be_valid
      b = build(:article, slug: a.slug)
      expect(b).not_to be_valid
      expect(b.errors[:slug]).to include('has already been taken')
    end
  end

  describe '.recent' do #can tell is class method bc of . (not instance method/#)
    it 'returns articles in the proper order' do 
      older_article = create(:article, created_at: 1.hour.ago)
      newer_article = create(:article)

      expect(described_class.recent).to eq(
        [newer_article, older_article]
      )

      newer_article.update_column(:created_at, 2.hours.ago)
      
      expect(described_class.recent).to eq(
        [older_article, newer_article]
      )
    end
  end
end
