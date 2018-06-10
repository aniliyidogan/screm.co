module SessionsHelper
  def login(member)
    session[:member_id] = member.id
    cookies.signed[:member_id] = member.id
  end

  def out_poker
    OutPokerJob.perform_later(current_member, current_poker)
    session[:member_id] = nil
    cookies.delete :member_id
  end

  def master?
    current_member&.master?
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])
  end
end
