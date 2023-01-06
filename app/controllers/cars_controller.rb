class CarsController < ApplicationController

  before_action :set_car, only: %i[show edit destroy update]

  def index
    @q = current_user.cars.ransack(params[:q])
    @cars = @q.result(distinct: true).page(params[:page])
  end

  def show
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
  end

  def update
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :colour, :car_number, :car_owner, :user_id)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
