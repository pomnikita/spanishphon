require 'rubygems'
require 'sinatra/base'

class Spanishphon < Sinatra::Base
  get '/' do
    'Spanish app'
  end
end