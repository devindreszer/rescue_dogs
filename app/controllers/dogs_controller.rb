class DogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dog = Dog.find(params[:id])
    @dog_query = current_or_guest_user.dog_queries.find_by(dog_id: @dog.id)
    @dog_query.mark_match(session[:fortune])
  end

end
