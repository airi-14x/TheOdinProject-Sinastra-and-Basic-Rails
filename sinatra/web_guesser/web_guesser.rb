require 'sinatra'
require 'sinatra/reloader'

get '/' do
  current_number = Random.new(123).rand(100)
  erb :index, :locals => {:current_number => current_number}
end
