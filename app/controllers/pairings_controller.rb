class PairingsController < ApplicationController
  
  def new
    @pairing = Pairing.new
  end
  
  def create
    @pairing = Pairing.new(pairing_params)
    @pairing.user_id = current_user.id
    if @pairing.save
      redirect_to pairing_path(@pairing)
    else
      render :new
    end
  end
  
  def index
    @pairings = Pairing.all
  end
  
  def show
    @pairing = Pairing.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    @pairing = Pairing.find(params[:id])
    @pairing.destroy
    redirect_to pairings_path
  end
  
  def edit
    @pairing = Pairing.find(params[:id])
  end
  
  def update
    @pairing = Pairing.find(params[:id])
    if @pairing.update(pairing_params)
      redirect_to pairing_path(@pairing)
    else
      render :edit
    end
  end
  
  private
  
  def pairing_params
    params.require(:pairing).permit(:title, :image, :caption)
  end
  
end
