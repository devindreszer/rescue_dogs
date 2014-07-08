class DogsController < ApplicationController

  def index
    @dogs = current_user.dogs if user_signed_in?
  end

  def show
    @dog = Dog.find(params[:id])
    if user_signed_in? && !current_user.dogs.where(id: @dog.id).exists?
      current_user.dog_matches.create(dog: @dog)
    end
  end

end
