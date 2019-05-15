class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @Tag = Tag.find(params[:id])
    @Tag.destroy
    flash.notice = "Tag '#{@Tag.name}' Deleted!"
    redirect_to tags_path
  end
end
