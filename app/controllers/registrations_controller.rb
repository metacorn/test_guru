class RegistrationsController < Devise::RegistrationsController

  def create    
    super
    flash[:notice] = "Hi, #{current_user.first_name} #{current_user.last_name}!" if current_user
  end

  private
  
  def sign_up_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

end 