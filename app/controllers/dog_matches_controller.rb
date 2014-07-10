class DogMatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:favorite]
      @dog_matches = current_user.dog_matches.where(is_favorite: true).order(:created_at).reverse
      @dogs = @dog_matches.map(&:dog)
    elsif params[:top_dog]
      @dog_matches = current_user.dog_matches.where(is_top: true).order(:created_at).reverse
      @dogs = @dog_matches.map(&:dog)
    else
      @dog_matches = current_user.dog_matches.order(:created_at).reverse
      @dogs = @dog_matches.map(&:dog)
    end
  end

  def update
    @dog_match = DogMatch.find(params[:id])

    # Check to see what param the user passed
    if params[:is_favorite].nil?

      # If a dog is crowned, remove all other crowns from other dogs
      if params[:is_top] == "true"
        current_user.dog_matches.each do |dog_match|
          dog_match.is_top = false
          dog_match.save
        end
      end

      # Set the is_top value from the param passed by user
      @dog_match.is_top = params[:is_top]

    else

      if params[:is_favorite] == "false"
        @dog_match.is_top = "false"
      end

      @dog_match.is_favorite = params[:is_favorite]
    end

    @dog_match.save
    redirect_to :back
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog_match = DogMatch.find_by(dog_id: @dog.id)
    dog_name = @dog.name
    @dog_match.destroy
    redirect_to dog_matches_path, alert: "#{dog_name} was removed."
  end

end
