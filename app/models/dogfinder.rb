class Dogfinder
  COUNT = "25"

  def random(zip)
    if Dog.find_by(last_zip: zip).nil? || Dog.where(last_zip: zip).count < COUNT.to_i
      collect(zip).sample
    else
      Dog.where(last_zip: zip).sample
    end
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

  def collect(zip)
    petfinder_dogs = client.find_pets("dog", zip, count: COUNT)
    @dogs = []

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

  def set_shelter(petfinder_shelter)
    shelter = Shelter.create_from_petfinder(petfinder_shelter)
    shelter.save
    shelter
  end

end
