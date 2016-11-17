require 'sinatra'
require 'sinatra/reloader'
require './helpers/blackjack_helper.rb'
helpers BlackjackHelper
enable :sessions
# Avoid warning: http://stackoverflow.com/a/18047653/5113832
set :session_secret, '*&(^B234'

get "/" do

  erb :index

end

get "/blackjack" do

  erb :blackjack
  # generate new game

end
