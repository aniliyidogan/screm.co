class ResetPokerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "reset_poker_#{current_member.poker_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
