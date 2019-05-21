require 'sinatra'
require 'sinatra/reloader'

get '/' do
  current_number = Random.new(123)
  "THE SECRET NUMBER IS #{current_number.rand(100)}"
end
