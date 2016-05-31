class PicturesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @comment = Comment.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create_with_user(picture_params, current_user)
    if @picture.save
    redirect_to '/pictures'
  else
    flash[:notice] = "Upload failed"
    render 'new'
    end
  end
  def edit
    @picture = Picture.find(params[:id])

  end

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to '/pictures'
  end
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "#{@picture.caption} deleted successfully"
    redirect_to '/pictures'
  end


  def picture_params
    params.require(:picture).permit(:caption, :location, :image)
  end

end
