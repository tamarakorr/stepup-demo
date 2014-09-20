class VacanciesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  #before_action :ngo_user, only: [:new]
  helper_method :sort_column, :sort_direction

  def index
    @vacancies = sort
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @ngo = current_user.ngo
    @vacancy = @ngo.vacancy.build(vacancy_params)
    if @vacancy.save
      flash[:success] = "New vacancy created!"
      redirect_to root_url
    else
      #render 'static_pages/home'
      render new_vacancy_path
    end
  end

  def destroy
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  private

    def vacancy_params
      params.require(:vacancy).permit(:ngo_id,:service,:skill,:work_region,:language,
        :remote_status,:when_needed,:desc,:title,:is_active)
    end

    def sort_column
      # Sort by service if nothing specified
      Vacancy.column_names.include?(params[:sort]) ? params[:sort] : "service"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def sort
      Vacancy.joins(:ngo).order(sort_column + " " + sort_direction).paginate(page: params[:page],
        per_page: 10)
    end
end
