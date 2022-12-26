class CarsController < ApplicationController

  def index
    @cars = current_user.cars
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new(user_id: params[:user_id])
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to @car
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def car_params
    params.require(:car).permit(:brand, :model, :colour, :car_number, :car_owner, :user_id, parkings_attributes: [:id, :description, :done, :_destroy])
  end
end
