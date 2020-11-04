class UsersController < ApplicationController
    before_filter :authenticate_user!

    def new
        @user = User.new
      end
    
      def create
        @user = User.create(params.require(:user).permit(:email,
                                                         :password))
        session[:user_id] = @user.id
        redirect_to '/services'
      end
end
