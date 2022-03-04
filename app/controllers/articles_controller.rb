class ArticlesController < ApplicationController
  # [ ? ] is it default that the router evaluates the action defind as index method?
  def index
    @articles = Article.all
  end

  def show 
    @article = Article.find(params[:id])
  end
end
