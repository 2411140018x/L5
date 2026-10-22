class ProfilesController < ApplicationController
  before_action :require_login

  def new
    return redirect_to edit_profile_path if current_user.profile
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(message: params[:profile][:message])
    if @profile.save
      redirect_to root_path, notice: "プロフィールを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = current_user.profile
    redirect_to new_profile_path unless @profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(message: params[:profile][:message])
      redirect_to root_path, notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def require_login
    redirect_to root_path, alert: "ログインしてください" unless current_user
  end
end