class VacanciesController < ApplicationController
  before_action :signed_in_user  #, only: [:create, :destroy]

  def index
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

  private

    def vacancy_params
      params.require(:vacancy).permit(:ngo_id,:service,:skill,:work_region,:language,
        :remote_status,:when_needed,:desc,:title,:is_active)
    end
end