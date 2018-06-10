class PagesController < ApplicationController
  before_action :check_member, only: %i(points)

  def home
    if master?
      @members = Member.where(poker: current_poker).order(created_at: :desc)
      fresh_when etag: @members
    elsif current_member
      @cards = Card.all
      fresh_when etag: @cards
    end
  end

  def about; end

  def points
    @choose_cards = ChooseCard.includes(:member, :card).where(poker: current_poker).order(created_at: :desc)
    fresh_when etag: @choose_cards
  end
end
