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
  session["player_win"] = false
  session["dealer_win"] = false
  erb :index
end

get "/blackjack" do
  deal_initial if session["bet"] == 0
  add_totals
  bust_check
  erb :blackjack
end

post "/blackjack" do
  bet = params[:bet].to_i
  session["bet"] = bet
  erb :blackjack
end

post "/reset" do
  reset
  redirect to('/')
end

post "/hit" do
  player_hit
  redirect to('/blackjack')
end

post "/deal" do
  redeal
  deal_initial if session["bet"] == 0
  add_totals
  erb :blackjack
end

post "/stay" do
  dealer_hit
  check_win
  erb :blackjack
end

post "/win" do
  add_to_purse
  redeal
  deal_initial if session["bet"] == 0
  add_totals
  erb :blackjack
end

post "/lose" do
  minus_from_purse
  redeal
  deal_initial if session["bet"] == 0
  add_totals
  erb :blackjack
end
