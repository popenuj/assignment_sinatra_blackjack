require 'sinatra'
require 'sinatra/reloader'
require 'erb'
require './helpers/blackjack_helper.rb'

helpers BlackjackHelper

enable :sessions
# Avoid warning: http://stackoverflow.com/a/18047653/5113832
set :session_secret, '*&(^B234'

get "/" do

  session["bet"] = 0
  session["purse"] = 100
  session["player_cards"] = []
  session["dealer_cards"] = []
  session["player_total"] = 0
  session["dealer_total"] = 0
  session["player_bust"] = false
  session["dealer_bust"] = false
  erb :index
end

get "/blackjack" do

  deal_initial if session["bet"] == 0

  add_totals

  erb :blackjack

end

post "/blackjack" do

  bet = params[:bet]
  session["bet"] = bet

  erb :blackjack

end

post "/reset" do
  reset
  redirect to('/')
end

post "/hit" do
  player_hit
  erb :blackjack
end
