require './caesar_cipher'

class CaesarCipherApp < Sinatra::Base

  #configure :development do
  #  register Sinatra::Reloader
  #end

  not_found do
    erb :error
  end

  get '/' do
    erb :index
  end

  post '/' do
    @cipher1 = CaesarCipher.new
    params.inspect
    @original_str = params['original_str']
    @result_cipher = @cipher1.ciphering(@original_str,params['shift_index'])
    erb :result, locals: {original_str: @original_str, ciphered: @result_cipher}
  end
end
