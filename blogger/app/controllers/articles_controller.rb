class ArticlesController < ApplicationController
include ArticlesHelper

  #before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  def index
      @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    #@comment = @article.comments.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(
      article_params
    )
    #@article.title = params[:article][:title]
    #@article.body = params[:article][:body]
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to articles_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Destroyed!"
    redirect_to articles_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

end
