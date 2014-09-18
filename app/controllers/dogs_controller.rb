class DogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dog = Dog.find(params[:id])
    if user_signed_in? && !current_user.dog_queries.where(dog_id: @dog.id, is_match: true).exists?
      current_user.dog_queries.create(dog: @dog, is_match: true, fortune: session[:fortune])
    end
    @dog_match = current_user.dog_queries.find_by(dog_id: @dog.id)
  end

end
