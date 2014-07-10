class DogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dog = Dog.find(params[:id])
    if user_signed_in? && !current_user.dogs.where(id: @dog.id).exists?
      current_user.dog_matches.create(dog: @dog)
    end
  end

end
