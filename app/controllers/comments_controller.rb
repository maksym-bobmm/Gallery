# frozen_string_literal: true

# comment controller class
class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :find_image, only: [:create]
  def new
    @comment = Comment.new
  end

  def create
    current_user.comments.create!(comment_params)
    Log.create(user_id: current_user.id, url: request.referer, created_at: Time.now, action_id: 3)
    redirect_to image_path(params[:image_id])
  end

  private

  def comment_params
    params.permit(:body, :image_id)
  end

  # TODO: NEED REFACTOR
  def find_image
    img_id = params[:image_id] || params[:comment][:image_id]
    @image = Image.find(img_id)
  end
end
