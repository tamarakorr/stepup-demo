class StaticPagesController < ApplicationController
  def home
    @volunteer = current_user.volunteer if signed_in?
    @ngo = current_user.ngo if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
