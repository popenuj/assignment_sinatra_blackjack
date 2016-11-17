module BlackjackHelper

  def deal_initial
    2.times do
      session["player_cards"] << deck
      session["dealer_cards"] << deck
    end
  end

  def hit
    session["player_cards"] << deck
    session["dealer_cards"] << deck
  end

  def deck
    [1,2,3,4,5,6,7,8,9,10,11,12,13].product(%w(clubs diamonds hearts spades)).sample
  end

  def add_totals
    session["player_total"] = session["player_cards"].inject(0) do |running_total, card| 
      if card[0] > 10
        running_total + 10
      else
        running_total + card[0]
      end
    end
    session["dealer_total"] = session["dealer_cards"].inject(0) do |running_total, card| 
      if card[0] > 10
        running_total + 10
      else
        running_total + card[0]
      end
    end
  end

end
