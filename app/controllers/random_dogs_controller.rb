class RandomDogsController < ApplicationController

  def show
    dogfinder = Dogfinder.new
    @random_dog = dogfinder.random(params[:zip])

    # check for errors after random method is called
    if dogfinder.zip_error.present?
      flash[:alert] = dogfinder.zip_error
      redirect_to "/"
    else
      session[:dog_id] = @random_dog.id
      session[:zip] = params[:zip]
    end
  end

end
