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
  erb :index

end

get "/blackjack" do

  deal_card

  erb :blackjack
  # generate new hand (start round)
  # ask for bet
    # if bet is
      # 0 render asking for bet
    # else
      # deal hands calling deck method
      # ask deck for card twice:
      # player_cards & dealer_cards = arrays
      # interpolate card hand data into png for display

end

post "/blackjack" do

  bet = params[:bet]
  session["bet"] = bet

  erb :blackjack

end
