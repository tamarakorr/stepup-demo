class VacanciesController < ApplicationController
  before_action :signed_in_user  #, only: [:create, :destroy]

  def index
    @vacancies = Vacancy.joins(:ngo).order(work_region: :asc,
      service: :asc).paginate(page: params[:page], per_page: 10)
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
end