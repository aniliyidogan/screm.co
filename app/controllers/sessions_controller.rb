class SessionsController < ApplicationController
  before_action :ip_restriction, only: %i(create)
  before_action :find_poker, only: %i(create)

  def create
    member = @poker.members.new(name: params[:name])
    if member.save
      login(member)
    else
      flash[:alert] = member.errors.full_messages.to_sentence
    end

    redirect_to root_path
  end

  def create_with_omniauth
    member = Member.find_or_initialize_by(provider: auth['provider'], uid: auth['uid'])
    member.update_with_omniauth(auth['info'])
    login(member)

    redirect_to root_path
  end

  def destroy
    out_poker
    redirect_to root_path
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  def ip_restriction
    redirect_to(request.referer, alert: I18n.t('ip_restriction')) if Rails.cache.exist?(request.ip)
  end

  def find_poker
    @poker = Poker.find_by(pin_code: params[:pin_code])
    if @poker.nil?
      Rails.cache.fetch(request.ip, expires_in: 5.seconds) { true }
      redirect_to(request.referer, alert: I18n.t('poker_not_found'))
    end
  end
end
