class ScootersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @scooters = Scooter.all
  end

  def my_scooters
    @scooters = Scooter.where(user: current_user)
  end

  def show
    @scooter = Scooter.find(params[:id])
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @scooter = Scooter.new(scooter_params)
    @scooter.user = current_user

    if @scooter.save
      redirect_to @scooter
    else
      render :new
    end
  end

  def edit
    @scooter = Scooter.find(params[:id])
  end

  def update
    # scooter i want to update
    @scooter = Scooter.find(params[:id])
    #updating the fields
    @scooter.update(scooter_params)
    #saving it inside your db
    if @scooter.save
      #after saving, i want to go to a page: show page of the current scooter
      redirect_to scooter_path(@scooter)
    else
      render :edit
    end
  end

  def destroy
    @scooter = Scooter.find(params[:id])
    @scooter.destroy

    redirect_to my_scooters_scooters_path
  end

  private

  def scooter_params
    params.require(:scooter).permit(:name, :description)
  end

end
