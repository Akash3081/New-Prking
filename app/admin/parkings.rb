ActiveAdmin.register Parking do
menu priority: 4
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :maximum_size, :security_provision, :parking_duration, :chance_to_get_parking, :parking_cost_per_hour, :average_departure_time, :type_of_parking_facility, :type_of_security, :distance_to_supermarket, :distance_from_stores, :car_id
  #
  # or
  #
  permit_params do
    permitted = [:maximum_size, :security_provision, :parking_duration, :chance_to_get_parking, :parking_cost_per_hour, :average_departure_time, :type_of_parking_facility, :type_of_security, :distance_to_supermarket, :distance_from_stores, :car_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
