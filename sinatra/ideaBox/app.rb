# frozen_string_literal: true

require 'bundler'
require './idea'
Bundler.require

class IdeaBoxApp < Sinatra::Base
  set :method_override, true
  not_found do
    erb :error
  end

  get '/' do
    erb :index, locals: { ideas: Idea.all }
  end

  post '/' do
    # params.inspect
    # 1. Create an idea based on the form parameters
    # idea = Idea.new(params['idea_title'], params['idea_description'])
    # idea = Idea.new(title: params['idea_title'], description: params['idea_description'])
    idea = Idea.new(params[:idea])
    # 2. Store it
    idea.save
    # 3. Send us back to the index page to see all ideas
    redirect '/'
  end

  get '/:id/edit' do |id|
    idea = Idea.find(id.to_i)
    erb :edit, locals: { id: id, idea: idea }
  end

  put '/:id' do |id|
    # "Tweaking the IDEA!"
    #data = {
    #  title: params['idea_title'],
    #  description: params['idea_description']
    #}
    #Idea.update(id.to_i, data)
    Idea.update(id.to_i, params[:idea])
    redirect '/'
  end
  delete '/:id' do |id|
    Idea.delete(id.to_i)
    redirect '/'
  end
  # run! if app_file == $0
end
