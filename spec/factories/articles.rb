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
    title { "Sample article" }
    content { "Sample content" }
    # no longer works with unique validation
    # slug { "sample-article-slug" }
    slug { "#{(0...10).map { ('a'..'z').to_a[rand(26)] }.join}" }
  end
end
