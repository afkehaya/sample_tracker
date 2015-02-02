ActiveAdmin.register User do
menu priority: 2
controller do
      skip_after_action :verify_authorized


  def permitted_params
    params.permit user: [:name, :email, :role, :school_id]
  end  

end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
