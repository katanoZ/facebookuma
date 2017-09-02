class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    execute_kuma_relationship(@user)
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end

  private
  def execute_kuma_relationship(other_user)
    if other_user.provider == "kuma_provider"
      other_user.delay(run_at: 10.seconds.from_now).follow!(current_user)
    end
  end
end
