class EndUsersController < ApplicationController
	def show
		@end_user = current_end_user
	end

	def edit
		@end_user = EndUser.find(params[:id])
		@end_user = current_end_user
	end

	def update
		@end_user = current_end_user
		@end_user = EndUser.find(params[:id])
		@end_user.update(end_user_params)
		redirect_to end_users_my_page_path
		if current_end_user != @end_user
           redirect_to end_users_my_page_path(current_end_user)
        end
	end
	# unsubscribe退会処理画面を表示する
	def unsubscribe
		@end_user = current_end_user
	end
	# withdraw退会処理を実行する、:rootはroot_pathに変更
	def withdraw
		@end_user = current_end_user
    	@end_user.update(is_deleted: true)
    	reset_session
    	redirect_to root_path
	end

	private
    def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
