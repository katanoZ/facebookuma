class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)

    if @user.provider == "kuma_provider"
      execute_kuma_relationship(@user)
    else
      Notification.create(user_id: @user.id, follower_id: current_user.id, notification_type: "follow")
      Pusher.trigger("user_#{@user.id}_channel", 'notification_created', {
        unread_counts: Notification.where(user_id: @user.id, read: false).count
      })
    end
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end

  private
  def execute_kuma_relationship(kuma)
    return if kuma.following?(current_user)
    return if Delayed::Job.where(queue: "#{kuma.id.to_s}_follows_#{current_user.id.to_s}").present?

    kuma.delay(run_at: 30.seconds.from_now, priority: 1, queue: "#{kuma.id.to_s}_follows_#{current_user.id.to_s}").follow!(current_user)

    Notification.delay(run_at: 31.seconds.from_now, priority: 2).create(user_id: current_user.id, follower_id: kuma.id, notification_type: "follow")
    Pusher.delay(run_at: 32.seconds.from_now, priority: 3).trigger("user_#{@current_user.id}_channel", 'notification_created', {
      unread_counts: Notification.where(user_id: current_user.id, read: false).count
    })
  end
end
