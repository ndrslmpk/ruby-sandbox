class ArticlesController < ApplicationController
  # [ ? ] is it default that the router evaluates the action defind as index method?
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
    @article = Article.new(title:"...", body:"...")
    # @articleDefault = Article.new(title:"Default Title", body:"Default Body")

    if @article.save
      redirect_to @article
    else
      # render :new(.html.erb) and return the status(code): of an unprocessable_entity Status code: 422
      render :new, status: :unprocessable_entity 
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body) # filters params
    end
end
