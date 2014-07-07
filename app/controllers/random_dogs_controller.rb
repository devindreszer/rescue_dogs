class RandomDogsController < ApplicationController

  def show
    @random_dog = Dogfinder.new.random(params[:zip])
  end

end
