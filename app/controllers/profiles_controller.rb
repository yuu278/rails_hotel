class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def edit
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to edit_profile_path, notice: "プロフィールを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :email, :icon, :self_introduction)
  end
end