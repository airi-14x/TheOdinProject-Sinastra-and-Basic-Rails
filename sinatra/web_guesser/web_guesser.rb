# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  current_number = Random.new(123).rand(100)
  guess = params['guess']
  message = ''
  unless params['guess'].nil?
    if Integer(guess) > current_number
      message = if Integer(guess) > current_number + 5
                  'Way Too High!'
                else
                  'Too High!'
                end
    end
    if Integer(guess) < current_number
      message = if Integer(guess) < current_number - 5
                  'Way Too Low!'
                else
                  'Too Low!'
                end
    end
    if Integer(guess) == current_number
      message = 'Perfect! Congrats, your guess was correct!'
    end
    erb :index, locals: { current_number: current_number, message: message }
end
end
