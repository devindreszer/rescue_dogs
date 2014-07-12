class Dogfinder
  COUNT = "25"

  attr_accessor :zip_error

  def collect(zip)
    # Collect COUNT number of dogs from database
    # Catch invalid zip codes; set zip_error and return nil
    begin
      petfinder_dogs = client.find_pets("dog", zip, count: COUNT)
    rescue Petfinder::Error
      self.zip_error = "Invalid zip code"
      return
    end

    @dogs = []

    # Add petfinder dogs and their shelters to the database
    # Then add it to the dog array returned to the controller
    petfinder_dogs.each do |petfinder_dog|
      petfinder_shelter = client.shelter(petfinder_dog.shelter_id)
      shelter = set_shelter(petfinder_shelter)

      if Dog.find_by(petfinder_id: petfinder_dog.id).nil?
        dog = shelter.dogs.build
        dog.set_from_petfinder(petfinder_dog)
        dog.last_zip = zip
      else
        dog = Dog.find_by(petfinder_id: petfinder_dog.id)
        dog.last_zip = zip
      end

      shelter.save
      @dogs << dog
    end

    @dogs
  end

  def find(id)
    client.pet(id)
  end

  def shelter(shelter_id)
    client.shelter(shelter_id)
  end

  private

  def client
    Petfinder::Client.new(ENV['PETFINDER_KEY'], ENV['PETFINDER_SECRET'])
  end

  def set_shelter(petfinder_shelter)
    shelter = Shelter.create_from_petfinder(petfinder_shelter)
    shelter.save
    shelter
  end

end
