class VolunteersController < ApplicationController
  before_action :signed_in_user  #, only: [:create, :destroy]

  def index
    @volunteers = Volunteer.order(cause: :asc, work_region: :asc,
      service: :asc).paginate(page: params[:page], per_page: 15)
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
      #render 'static_pages/home'
      render new_volunteer_path
    end
  end

  def destroy
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  private

    def volunteer_params
      params.require(:volunteer).permit(:user_id,:cause,:work_region,:skill,:availability,
        :service,:remote_status,:contact_mobile,:contact_city,:contact_country)
    end
end