class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[:show]

  def index
    @users = User.all
  end

  def show
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
