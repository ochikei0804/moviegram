class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(movie_id: params[:movie_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @movie = Movie.find(params[:movie_id])
    @favorite = current_user.favorites.find_by(movie_id: @movie.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
