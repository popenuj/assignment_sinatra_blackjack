module BlackjackHelper

  def deal_card
    if session["player_cards"].length == 0
      2.times do
        session["player_cards"] << deck
      end
    else
    session["player_cards"] << deck
    end
    if session["dealer_cards"].length == 0
      2.times do
        session["dealer_cards"] << deck
      end
    else
    session["dealer_cards"] << deck
    end
  end

  def deck
    [1,2,3,4,5,6,7,8,9,10,11,12,13].product(%w(clubs diamonds hearts spades)).sample
  end

end
