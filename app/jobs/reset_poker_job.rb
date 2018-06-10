class ResetPokerJob < ApplicationJob
  queue_as :default

  def perform(poker)
    ActionCable.server.broadcast("reset_poker_#{poker.id}", {})
    ChooseCard.where(poker: poker).delete_all
    poker.update(locked: false, suggested: nil)
  end
end
