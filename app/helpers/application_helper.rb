module ApplicationHelper
  def provider_path(omniauth)
    "/auth/#{omniauth}"
  end

  def current_pin_code
    current_member.poker.pin_code
  end

  def current_poker
    current_member.poker
  end
end
