class NgosController < ApplicationController
  before_action :signed_in_user  #, only: [:create, :destroy]

  def index
  end

  def new
    @ngo = Ngo.new
  end

  def create
    @ngo = current_user.create_ngo(ngo_params)
    if @ngo.save
      flash[:success] = "NGO profile created!"
      redirect_to root_url
    else
      #render 'static_pages/home'
      render new_ngo_path
    end
  end

  def destroy
  end

  private

    def ngo_params
      params.require(:ngo).permit(:name,:contact_city,:contact_country,:contact_phone)
    end
end