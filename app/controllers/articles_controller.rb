class ArticlesController < ApplicationController
  # [ ? ] is it default that the router evaluates the action defind as index method?
  # REMARK:
  #         Understand that each of the instance variables defined by @instance_variable are accessible via the ERB-ruby-tags '<=% %>' and '<% %>'
  
  #########
  # READ
  #########

  def index
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end
  
  def first
    @article = Article.find([id:1])
  end

  def topfive
    @topfive = Article.find(:all, :order => "id desc", :limit => 5)
  end

  #########
  # CREATE
  #########

  def new 
    @article = Article.new
  end


  def create
    @article = Article.new(title:"...", body:"...")
    # @articleDefault = Article.new(title:"Default Title", body:"Default Body")

    if @article.save
      # redirect_to forces the browser to make a new request
      redirect_to @article
    else
      # render :new(.html.erb) and return the status(code): of an unprocessable_entity Status code: 422
      render(:new, status: :unprocessable_entity)
    end
  end

  #########
  # UPDATE
  #########
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: unprocessable_entity
    end
    
  end

  #########
  # UPDATE
  #########

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other 
  end

  private
    # method: @article_params
    # This method is used to allow the usage of parameters, that are explicitly allowed.
    # Using this opt-in method, malicious attackers are not able to attach other parameters that might trigger malicious and unexpected actions.
    def article_params
      params.require(:article).permit(:title, :body) # filters params
    end
end
