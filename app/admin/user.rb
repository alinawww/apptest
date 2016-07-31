ActiveAdmin.register User do
  # index do
  #   column :name
  #   column :email
  #   column :summary
  #   column :twitter
  #   column :linkedin
  #   column :github
  # end
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
permit_params [:email, :password, :password_confirmation, :type]

  form do |f|
      f.inputs "User" do
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.radio_button("type", "Speaker")
        f.label :type, ' Speaker '
        f.radio_button("type", "Attendee")
        f.label :type, ' Attendee'
      end
      f.actions
    end

end
