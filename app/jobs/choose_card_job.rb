class ChooseCardJob < ApplicationJob
  queue_as :default

  def perform(choose_card)
    ActionCable.server.broadcast(
      "choose_card_channel_#{choose_card.poker_id}",
      id: choose_card.id,
      name: choose_card.card.name,
      member_name: choose_card.member.name,
      member_card_partial: member_card_render(choose_card)
    )
  end

  private

  def member_card_render(choose_card)
    ApplicationController.renderer.render(
      partial: 'cards/choose_card',
      locals: { current_poker: choose_card.poker, choose_card: choose_card }
    )
  end
end
