class ChooseCardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "choose_card_channel_#{current_member.poker_id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
