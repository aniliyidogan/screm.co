class CardsController < ApplicationController
  before_action :check_member, only: %i(choose)

  def choose
    return redirect_to(request.referer, alert: I18n.t('poker_locked')) if current_poker.locked?

    choose_card = ChooseCard.find_or_initialize_by(poker: current_poker, member: current_member)
    choose_card.update(params_card_id)
    ChooseCardJob.perform_later(choose_card)
    redirect_to points_path
  end

  private

  def params_card_id
    params.permit(:card_id)
  end
end
