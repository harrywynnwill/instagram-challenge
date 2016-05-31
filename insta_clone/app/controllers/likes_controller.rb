class LikesController < ApplicationController
  before_action :authenticate_user!


  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    redirect_to "/pictures/#{@picture.id}"
  end

end
