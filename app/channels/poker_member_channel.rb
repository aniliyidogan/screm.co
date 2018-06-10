class PokerMemberChannel < ApplicationCable::Channel
  def subscribed
    stream_from "poker_member_#{current_member.poker_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
