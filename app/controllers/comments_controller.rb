class CommentsController < ApplicationController
  before_action :get_image
  def new
    @comment = Comment.new
    @image
    # raise QWE
  end
  def create
    comment = @image.comments.new(comment_params)
    comment.user = current_user
    comment.save
    Log.create(user_id: current_user.id, url: request.referer, created_at: Time.now, action_id: 3)
    # raise qwe
    redirect_to "#{images_path}/#{params[:comment][:image_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :image_id)
  end
# todo need refactor
  def get_image
    if params[:image_id]
      @image = Image.find(params[:image_id])
    else
      @image = Image.find(params[:comment][:image_id])
    end
  end
end
