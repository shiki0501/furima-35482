class ItemsController < ApplicationController

  def index
    @articles = Article.order("created_at DESC")
  end

  def new
    # if 
    # @article = Article.new
  end

  def create
    # @article = Article.new(article_params)
    # if @article.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  # private

  # def article_params
  #   params.require(:article).permit(:title,:text,:category_id)
  # end

end
