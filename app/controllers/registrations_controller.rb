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
    if @user.save
      WelcomeMailer.welcome_email(@user).deliver_now
      redirect_to '/congrats'
    else
      render :new
    end
  end

  def update
    super
  end

  private

  def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
  end
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
