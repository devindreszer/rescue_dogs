class DogMatchesController < ApplicationController

  def index
    @dog_matches = current_user.dogs if user_signed_in?
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog_match = DogMatch.find_by(dog_id: @dog.id)
    dog_name = @dog.name
    @dog_match.destroy
    redirect_to dog_matches_path, alert: "#{dog_name} was removed."
  end

end
