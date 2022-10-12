class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    #  privateが指すconfirure_permitted_parametersメソッドはこのコントローラーの中だけしか使えない
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  
  

  
end

Refile.secret_key = 'cb03a3d521b44399a782a30d2210f762f664bc1a116d0f6cf4e96e8b8ac6e10a1c46ddc463713ea1563f31404a1ec2aa44e9272050a85cb240b3561d73cd475a'