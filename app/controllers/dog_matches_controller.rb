class DogMatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:favorite]
      @dog_matches = current_user.dog_matches.where(is_favorite: true)
      @dogs = @dog_matches.map(&:dog)
    else
      @dog_matches = current_user.dog_matches
      @dogs = @dog_matches.map(&:dog)
    end
  end

  def update
    @dog_match = DogMatch.find(params[:id])
    @dog_match.is_favorite = params[:is_favorite]
    @dog_match.save
    redirect_to dog_matches_path
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog_match = DogMatch.find_by(dog_id: @dog.id)
    dog_name = @dog.name
    @dog_match.destroy
    redirect_to dog_matches_path, alert: "#{dog_name} was removed."
  end

end
