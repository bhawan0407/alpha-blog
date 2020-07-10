class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article]
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article)
      # redirect_to @article # same as above
      flash[:notice] = 'Article was created successfully'
    else
      render ('new')
    end

  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
