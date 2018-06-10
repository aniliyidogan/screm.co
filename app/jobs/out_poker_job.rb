class OutPokerJob < ApplicationJob
  queue_as :default

  def perform(member, poker)
    if member.master
      ChooseCard.where(poker: poker).delete_all
      Member.where(poker: poker).delete_all
      poker.destroy
    else
      ChooseCard.where(member: member).delete_all
      member.destroy
    end
  end
end
