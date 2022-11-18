class ArticlesController < ApplicationController

  def index
    # status: :ok not necessary here but is explicit :shrug:
    articles = Article.recent
    render json: serializer.new(articles), status: :ok
  end

  def serializer
    ArticleSerializer
  end

  def show
    
  end
end