class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

private
  
  def redirect_if_not_signed_in
    if !signed_in?
      flash[:info] = I18n.t('user.signin_required')
      redirect_to signin_path
    end
  end
end
