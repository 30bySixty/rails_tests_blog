class ArticlesController < ApplicationController
  def index
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article successfully created."
      redirect_to articles_path
    else 
      flash.now[:danger] = "There was an error."
      #render new template again
      render :new
    end
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end