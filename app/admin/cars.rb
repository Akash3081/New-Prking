ActiveAdmin.register Car do
menu priority: 3
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :brand, :model, :colour, :car_number, :car_owner, :user_id
  #
  # or
  #
  permit_params do
    permitted = [:brand, :model, :colour, :car_number, :car_owner, :user_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
