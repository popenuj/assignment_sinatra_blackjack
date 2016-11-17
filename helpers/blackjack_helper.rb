module BlackjackHelper

  def deck
    [1,2,3,4,5,6,7,8,9,10,11,12,13].product(%w(clubs diamonds hearts spades)).sample
  end

end
