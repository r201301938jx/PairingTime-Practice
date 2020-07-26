class FavoritesController < ApplicationController
  
  def create
    pairing = Pairing.find(params[:pairing_id])
    favorite = current_user.favorites.new(pairing_id: pairing.id)
    favorite.save
    redirect_to pairing_path(pairing)
  end
  
  def destroy
    pairing = Pairing.find(params[:pairing_id])
    favorite = current_user.favorites.find_by(pairing_id: pairing.id)
    favorite.destroy
    redirect_to pairing_path(pairing)
  end

end
