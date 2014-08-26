class VolunteersController < ApplicationController
  before_action :signed_in_user  #, only: [:create, :destroy]

  def index
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = current_user.create_volunteer(volunteer_params)
    if @volunteer.save
      flash[:success] = "Volunteer profile created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def volunteer_params
      params.require(:volunteer).permit(:cause,:work_region,:skill,:availability,
        :service,:remote_status,:contact_mobile,:contact_city,:contact_country)
    end
end