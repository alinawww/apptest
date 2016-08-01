ActiveAdmin.register Speaker do
  index do
    column :name
    column :email
    column :twitter
    column :linkedin
    column :github
    actions
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
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params [:name, :email, :password, :password_confirmation]

  form do |f|
      f.inputs "Speaker" do
        f.input :name
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end

end
