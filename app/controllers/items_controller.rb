class ItemsController < ApplicationController

  def index
    @articles = Article.order("created_at DESC")
  end

  def new
    # binding.pry
    unless 
      user_signed_in? == true
      redirect_to  user_session_path
    end
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

  # def user_params
  #   params.require(:user)
  # end

  # def article_params
  #   params.require(:article).permit(:title,:text,:category_id)
  # end

end
