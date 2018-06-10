class PokersController < ApplicationController
  before_action :check_master, only: %i(reset result)

  def reset
    ResetPokerJob.perform_later(current_poker)
  end

  def result
    ResultPokerJob.perform_later(current_poker)
  end
end
