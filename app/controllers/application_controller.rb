class ApplicationController < ActionController::Base
  include ApplicationHelper
  include SessionsHelper

  def check_member
    redirect_to root_path unless current_member
  end

  def check_master
    redirect_to root_path unless master?
  end

  def ping
    render json: { ping: 'Hello World' }
  end
end
