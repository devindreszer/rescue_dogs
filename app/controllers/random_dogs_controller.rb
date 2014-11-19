class RandomDogsController < ApplicationController

  def show
    zip = params[:zip]
    request_path = URI(request.referrer).path
    user = current_or_guest_user
    dog = Dog.new
    @random_dog = dog.random(zip, request_path, user)

    # check for zip errors
    if dog.zip_error.present?
      flash[:alert] = dog.zip_error
      return redirect_to "/"
    end

    # Set session hash with the dog id and the zip called
    session[:dog_id] = @random_dog.id
    session[:zip] = zip

    # Set a fortune for the dog and save it a the session hash
    @fortune = Fortune.new.get
    session[:fortune] = @fortune
    @random_dog_name = @random_dog.name.split(/\b/).first.to_s
    @random_dog_message = "#{@random_dog_name} says... #{@fortune}"
  end
end
