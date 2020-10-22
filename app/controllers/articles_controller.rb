class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article)
                               .permit(:title, :description))
    if @article.save
      flash[:notice] = "Article created succesfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'update'
    end
  end

  def destroy
    Article.destroy(params[:id])
    flash[notice] = "Article was deleted successfully."
    redirect_to articles_path
  end
end
