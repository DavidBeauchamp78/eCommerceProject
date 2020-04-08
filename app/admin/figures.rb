ActiveAdmin.register Figure do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price, :image, :faction
  # form partial: 'form'
  form title: 'Edit figure' do |f|
    inputs 'Details' do
      input :name
      input :description
      input :price
      input :faction
      input :image, as: :file
    end
    para "Press cancel to return to the list without saving."
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
