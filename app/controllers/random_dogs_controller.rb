class RandomDogsController < ApplicationController

  def show
    zip = params[:zip]

    # Get all the random dogs from the database with the zip passed
    random_dogs = Dog.where(last_zip: zip)

    # check to see if there are enough dogs in the database with the zip passed
    # if not make an api request to collect more dogs in the database
    if random_dogs.nil? || random_dogs.count < Dogfinder::COUNT.to_i
      api_collect(random_dogs, zip)
    end

    # Collect all of the unviewed random dogs
    unviewed_random_dogs = random_dogs.where(is_viewed: false)

    # if this is a new search or all of the dogs have been viewed
    # set all random dogs to unviewed
    if URI(request.referrer).path == "/" || !unviewed_random_dogs.present?
      unview(random_dogs)
      unviewed_random_dogs = random_dogs.where(is_viewed: false)
    end

    # Sample an unviewed random dog from the collection
    @random_dog = unviewed_random_dogs.sample

    # Set the dog's viewed status to true
    @random_dog.is_viewed = true
    @random_dog.save

    # Set session hash with the dog id and the zip called
    session[:dog_id] = @random_dog.id
    session[:zip] = zip

    # Set a fortune cookie message for the dog
    @message = Message.new.get
  end

  private

  def api_collect(random_dogs, zip)
    dogfinder = Dogfinder.new
    random_dogs = dogfinder.collect(zip)

    # check for errors after collect method is called
    # to see if the zip is valid
    if dogfinder.zip_error.present?
      flash[:alert] = dogfinder.zip_error
      return redirect_to "/"
    end

    random_dogs
  end

  def unview(random_dogs)
    random_dogs.each do |random_dog|
      random_dog.is_viewed = false
      random_dog.save
    end
  end

end
