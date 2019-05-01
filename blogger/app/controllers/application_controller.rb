class ApplicationController < ActionController::Base
  def index
    @articles = Article.all
  end
  def edit
    @article = Article.find(params[:id])
  end
end
