class ParkingsController < ApplicationController
  def index
    @parkings = Parking.all
  end

  def show
    # @parking = current_user.cars.parking
    @parking = Parking.find(params[:id])
  end

  def new
    @parking = current_user.parkings.new(car_id: params[:car_id])
  end
  
  def create
    @parking = Parking.new(parking_params)
    if @parking.save
      UserMailer.welcome_email(current_user.id).deliver_now
      redirect_to @parking
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @parking = Parking.find(params[:id])
    @parking.destroy

    redirect_to cars_path, status: :see_other
  end
  
  private
    def parking_params
      params.require(:parking).permit(:maximum_size, :security_provision, :parking_duration, :chance_to_get_parking, :parking_cost_per_hour, :average_departure_time, :type_of_parking_facility, :type_of_security, :distance_to_supermarket, :distance_from_stores, :car_id, :user_id, :parking_name)
    end

end
