class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @volunteer = @user.volunteer
    @ngo = @user.ngo
    if ! (@ngo.nil?)
      if Vacancy.exists?(ngo_id: @ngo.id)
        @vacancies = @ngo.vacancy
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the StepUp Demo!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :name, :email, :password,
        :password_confirmation, :terms_and_conditions
      )
    end
end
