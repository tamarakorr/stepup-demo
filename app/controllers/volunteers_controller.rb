class VolunteersController < ApplicationController
  before_action :signed_in_user  #, only: [:create, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @volunteers = Volunteer
      .filtered_by(params[:filters])
        .order(sort_column + " " + sort_direction)
          .paginate(page: params[:page], per_page: 15)
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
    def sort_column
      # Sort by service if nothing specified
      Volunteer.column_names.include?(params[:sort]) ? params[:sort] : "service"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end