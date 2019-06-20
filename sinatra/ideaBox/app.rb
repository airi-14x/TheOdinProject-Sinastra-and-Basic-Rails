require 'bundler'
require './idea'
Bundler.require

class IdeaBoxApp < Sinatra::Base
  not_found do
    erb :error
  end

  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end

  post '/' do
    #params.inspect
  # 1. Create an idea based on the form parameters
  idea = Idea.new(params['idea_title'], params['idea_description'])
  # 2. Store it
  idea.save
  # 3. Send us back to the index page to see all ideas
  redirect '/'

  end

  #run! if app_file == $0
end
