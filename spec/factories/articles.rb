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
FactoryBot.define do
  factory :article do
    # title { "Sample article" }
    sequence(:title) { |n| "Sample article #{n}" }

    content { "Sample content" }
    
    # no longer works with unique validation
    # slug { "sample-article-slug" }
    # !!! per https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#uniqueness
    sequence(:slug) { |n| "sample-article-#{n}" }
  end
end
