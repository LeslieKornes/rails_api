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
class Article < ApplicationRecord
  # validates :content, presence: true
  # validates :title, presence: true
  # validates :slug, presence: true

  validates_presence_of :content, :title, :slug
  validates :slug, uniqueness: true

end
