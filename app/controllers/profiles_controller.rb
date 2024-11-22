class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to edit_profile_path, notice: 'プロフィールが更新されました'
    else
      flash.now[:alert] = 'プロフィールの更新に失敗しました'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :icon, :self_introduction)
  end
end