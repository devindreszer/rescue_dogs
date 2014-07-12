class RandomDogsController < ApplicationController

  def show
    zip = params[:zip]
    @random_dogs = Dog.where(last_zip: zip)

    # check to see if there are enough dogs in the database with the zip passed
    # if not make an api request to collect more dogs in the database
    if @random_dogs.nil? || @random_dogs.count < Dogfinder::COUNT.to_i
      dogfinder = Dogfinder.new
      @random_dogs = dogfinder.collect(zip)

      # check for errors after collect method is called
      # to see if the zip is valid
      if dogfinder.zip_error.present?
        flash[:alert] = dogfinder.zip_error
        return redirect_to "/"
      end
    end

    # Sample a random dog from the collection
    @random_dog = @random_dogs.sample

    # Set session hash with the dog id and the zip called
    session[:dog_id] = @random_dog.id
    session[:zip] = params[:zip]

    # Set a fortune cookie message for the dog
    @message = Message.new.get
  end

end
