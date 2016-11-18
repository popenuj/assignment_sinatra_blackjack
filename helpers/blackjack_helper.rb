module BlackjackHelper

  def deal_initial
    2.times do
      session["player_cards"] << deck
      session["dealer_cards"] << deck
    end
    blackjack_check
  end

  def player_hit
    session["player_cards"] << deck
  end

  def deck
    deck = [1,2,3,4,5,6,7,8,9,10,11,12,13].product(%w(clubs diamonds hearts spades))
    deck -= session["player_cards"]
    deck -= session["dealer_cards"]
    deck.sample
  end

  def add_totals
    session["player_total"] = session["player_cards"].inject(0) do |running_total, card|
      if card[0] == 1
        if running_total + 11 < 21
          running_total + 11
        else
          running_total + 1
        end
      elsif card[0] > 10
        running_total + 10
      else
        running_total + card[0]
      end

    end
    session["dealer_total"] = session["dealer_cards"].inject(0) do |running_total, card|
      if card[0] == 1
        if running_total + 11 < 21
          running_total + 11
        else
          running_total + 1
        end
      elsif card[0] > 10
        running_total + 10
      else
        running_total + card[0]
      end
    end
  end

  def bust_check
    if session["dealer_total"] > 21
      session["dealer_bust"] = true
    elsif session["player_total"] > 21
      session["player_bust"] = true
    end
  end

  def blackjack_check
    if session["player_total"] == 21
      session["player_blackjack"] = true
    elsif session["dealer_total"] == 21
      session["dealer_blackjack"] = true
    end
  end

  def reset
    redeal
    session["purse"] = 100
  end

  def redeal
    session["bet"] = 0
    session["player_cards"] = []
    session["dealer_cards"] = []
    session["player_total"] = 0
    session["dealer_total"] = 0
    session["player_bust"] = false
    session["dealer_bust"] = false
    session["bust"] = false
  end

end
