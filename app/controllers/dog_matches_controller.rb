class DogMatchesController < ApplicationController

  def index
    @dogs = current_user.dogs if user_signed_in?
    @dog_matches = current_user.dog_matches if user_signed_in?
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
