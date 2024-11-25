class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :authenticate_user!

    def index
      @users = User.all
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: 'ユーザー情報が更新されました'
        else
            render :edit
        end
    end

    private

    def set_user
      if params[:id] != 'sign_out'
        @user = User.find(params[:id])
      else
        redirect_to root_path, alert: '不正なユーザーIDです'
      end
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon_image)
    end
end