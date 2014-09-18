class DogQueriesController < ApplicationController
  before_action :authenticate_user!

  # display favorites, top dog, and matches
  # order by newly added
  def index
    @dog_matches = current_user.dog_queries.where(is_match: true).includes(dog: [{shelter: :address}]).order(created_at: :desc)
    if params[:favorite]
      @dog_matches = @dog_matches.where(is_favorite: true)
    elsif params[:top_dog]
      @dog_matches = @dog_matches.where(is_top: true)
    end
  end

  def update
    @dog_match = DogQuery.find(params[:id])

    # Check to see what param the user passed
    if params[:is_favorite].nil?

      # If a dog is crowned, remove all other crowns from other dogs
      if params[:is_top] == "true"
        current_user.dog_queries.each do |dog_query|
          dog_query.is_top = false
          dog_query.save
        end
      end

      # Set the is_top value from the param passed by user
      @dog_match.is_top = params[:is_top]

    else

      # remove the crown if a dog is unfavorited
      if params[:is_favorite] == "false"
        @dog_match.is_top = "false"
      end

      # set the dog favorite status
      @dog_match.is_favorite = params[:is_favorite]
    end

    @dog_match.save
    redirect_to :back
  end

  # def destroy
  #   @dog = Dog.find(params[:id])
  #   @dog_match = DogMatch.find_by(dog_id: @dog.id)
  #   dog_name = @dog.name
  #   @dog_match.destroy
  #   redirect_to dog_matches_path, alert: "#{dog_name} was removed."
  # end

end
