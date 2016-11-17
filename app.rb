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
  session["bust"] = false
  erb :index

end

get "/blackjack" do

  if session["bet"] == 0
    deal_initial
  elsif session["bust"] == false
    hit
  end
  add_totals

  erb :blackjack

end

post "/blackjack" do

  bet = params[:bet]
  session["bet"] = bet

  erb :blackjack

end
