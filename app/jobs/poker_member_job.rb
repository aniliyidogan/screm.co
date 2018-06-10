class PokerMemberJob < ApplicationJob
  queue_as :default

  def perform(member)
    ActionCable.server.broadcast(
      "poker_member_#{member.poker_id}",
      poker_member_partial: poker_member_render(member)
    )
  end

  private

  def poker_member_render(member)
    ApplicationController.renderer.render(partial: 'pokers/member', locals: { member: member })
  end
end
