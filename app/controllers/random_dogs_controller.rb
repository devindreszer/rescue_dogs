class RandomDogsController < ApplicationController

  def show
    @random_dog = Dogfinder.new.random(params[:zip])
    session[:dog_id] = @random_dog.id
    session[:zip] = params[:zip]
  end

end
