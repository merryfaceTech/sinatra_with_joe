require 'sinatra'
require "sinatra/base"
require "sinatra/reloader"
  
class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    after_reload do
      puts 'reloaded'
    end
  end

  get '/' do
    'Hello world!'
  end
  
  get '/llama-page' do
    'llamas everywhere!'
  end

  run! if app_file == $0
end