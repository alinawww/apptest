class RegistrationsController < Devise::RegistrationsController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
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
  #
  # def update
  #   # authorize! :update, @user
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       sign_in(@user == current_user ? @user : current_user, :bypass => true)
  #       format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # GET/PATCH /users/:id/finish_signup
 def finish_signup
   # authorize! :update, @user
   if request.patch? && params[:user] #&& params[:user][:email]
     if @user.update(user_params)
       @user.skip_reconfirmation!
       sign_in(@user, :bypass => true)
       redirect_to @user, notice: 'Your profile was successfully updated.'
     else
       @show_errors = true
     end
   end
 end

 # DELETE /users/:id.:format
 # def destroy
 #   # authorize! :delete, @user
 #   @user.destroy
 #   respond_to do |format|
 #     format.html { redirect_to root_url }
 #     format.json { head :no_content }
 #   end
 # end
  private
  # def set_user
  #    @user = User.find(params[:id])
  # end
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
