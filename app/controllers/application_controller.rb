class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_in_path_for(resource)
	  if current_admin
        flash[:notice] = "ログインに成功しました"
        admins_path  #指定したいパスに変更
      elsif current_end_user
      	items_path(id: current_end_user)
      else
      	flash[:notice] = "ログインに失敗しました"
        root_path  #指定したいパスに変更
      end
    end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
  	if resource_or_scope == :admin
      new_admin_session_path
    else
      new_end_user_session_path
    end
  end

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [ :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number])
        devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
    end
end
