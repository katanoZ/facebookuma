class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    if params[:back]
      @topic = Topic.new(topic_params)
    else
      @topic = Topic.new
    end
  end

  def confirm
    @topic = Topic.new(topic_params)
    render :new if @topic.invalid?
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "トピックを作成しました"
      NoticeMailer.sendmail_topic(@topic).deliver
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topics_path, notice: "トピックを編集しました"
    else
      render "edit"
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "トピックを削除しました"
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :content)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
