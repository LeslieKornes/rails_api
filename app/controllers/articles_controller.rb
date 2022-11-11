class ArticlesController < ApplicationController

  def index
    # status: :ok not necessary here but is explicit :shrug:
    render json: Article.all, status: :ok
  end

  def show
    
  end
end