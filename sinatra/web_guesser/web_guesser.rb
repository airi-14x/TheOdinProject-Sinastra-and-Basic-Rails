# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

$SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = ''
  message = check_guess(guess)
  erb :index, locals: { message: message}
end

def check_guess(guess)
  unless guess.nil? || guess.empty?
    if Integer(guess) > $SECRET_NUMBER
      message = if Integer(guess) > $SECRET_NUMBER + 5
                  'Way Too High!'
                else
                  'Too High!'
                end
    end
    if Integer(guess) < $SECRET_NUMBER
      message = if Integer(guess) < $SECRET_NUMBER - 5
                  'Way Too Low!'
                else
                  'Too Low!'
                end
    end
    if Integer(guess) == $SECRET_NUMBER
      message = 'Perfect! Congrats, your guess was correct!'
      message += " Secret Number was #{$SECRET_NUMBER}!"
    end
    message
  end

end
