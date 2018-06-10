class ResultPokerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "result_poker_#{current_member.poker_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
