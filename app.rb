require 'sinatra'
require 'sinatra/reloader'

get "/" do

  erb :index

end

get "/blackjack" do

  erb :blackjack

end
