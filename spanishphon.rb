require 'rubygems'
require 'sinatra'

class Spanishphon < Sinatra::Base
  get '/' do
    'Spanish app'
  end
end