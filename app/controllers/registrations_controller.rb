class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    type = params[:user][:type]
    # byebug
    user = User.new(sign_up_params)
    if type == "Speaker"
      user.type = "Speaker"
    else
      user.type = "Attendee"
    end
    user.save
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end
end
