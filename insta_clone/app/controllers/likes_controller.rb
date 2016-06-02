class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    byebug
    @likes = Like.all
  end
  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create.set_user!(current_user)
if @picture.save
    flash[:notice] = "Narci point given"
    redirect_to '/pictures'
  end

  end
  def delete
    byebug
    @picture = Picture.find(params[:picture_id])
    @like = @picture.likes.last
    byebug
    @like.destroy
    redirect_to '/pictures'
  end
end
