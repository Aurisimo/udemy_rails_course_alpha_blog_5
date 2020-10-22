class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article created succesfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    byebug
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'update'
    end
  end

  def destroy
    flash[notice] = "Article was deleted successfully."
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
