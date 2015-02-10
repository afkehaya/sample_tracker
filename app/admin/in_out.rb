ActiveAdmin.register InOut do
controller do
      skip_after_action :verify_authorized
      skip_before_action :set_global_search_variable
  def permitted_params
    params.permit in_out: [:status]
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
