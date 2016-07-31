class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @type = params[:user][:type]
    @user = User.new(sign_up_params)
    if @type == "Speaker"
      @user.type = "Speaker"
    else
      @user.type = "Attendee"
    end
    # @user.save
    if @user.save
      WelcomeMailer.welcome_email(@user).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    super
  end
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
