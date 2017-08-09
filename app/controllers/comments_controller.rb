class CommentsController < ApplicationController
  before_action :set_comment, only:[:edit, :update, :destroy]
  before_action :set_topic, only:[:edit, :update]

  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = "コメントを投稿しました。"
        format.js { render :index }
      end
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to topic_path(@topic), notice: "コメントを更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @comment.destroy
    flash.now[:notice] = "コメントを削除しました。"
    respond_to do |format|
      format.js {render :index}
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
    def set_topic
      @topic = Comment.find(params[:id]).topic
    end
end
