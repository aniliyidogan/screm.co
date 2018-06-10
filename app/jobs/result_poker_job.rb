class ResultPokerJob < ApplicationJob
  queue_as :default

  def perform(poker)
    @poker = poker

    ActionCable.server.broadcast(
      "result_poker_#{@poker.id}",
      choose_card_ids: choose_cards.pluck(:id),
      choose_card_names: choose_card_names,
      suggested: calculate_suggested(choose_card_names)
    )
    @poker.update(locked: true, suggested: @suggested)
  end

  def choose_cards
    @choose_cards ||= ChooseCard.includes(:card).where(poker: @poker)
  end

  def choose_card_names
    @choose_card_names ||= choose_cards.map { |cc| cc.card.name }
  end

  def calculate_suggested(choose_card_names)
    cards = Card.pluck(:name).map(&:to_i)
    points = choose_card_names.map(&:to_i)
    points.delete(0)
    avr = points.sum.to_f / points.count
    @suggested = cards.min_by { |c| (avr - c).abs }
  rescue
    @suggested = nil
  end
end
