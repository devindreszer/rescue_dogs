class RandomDogsController < ApplicationController

  def show
    zip = params[:zip]
    request_path = URI(request.referrer).path
    dog = Dog.new
    @random_dog = dog.random(zip, request_path)

    # check for zip errors
    if dog.zip_error.present?
      flash[:alert] = dog.zip_error
      return redirect_to "/"
    end

    # Set session hash with the dog id and the zip called
    session[:dog_id] = @random_dog.id
    session[:zip] = zip

    # Set a fortune cookie fortune for the dog
    @fortune = Fortune.new.get
    session[:fortune] = @fortune
  end
end
