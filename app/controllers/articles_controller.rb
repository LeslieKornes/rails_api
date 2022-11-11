class ArticlesController < ApplicationController

  def index
    # status: :ok not necessary here but is explicit :shrug:
    render json: serializer.new(Article.all), status: :ok
  end

  def serializer
    ArticleSerializer
  end

  def show
    
  end
end