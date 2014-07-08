class Dogfinder
  COUNT = "100"

  def random(zip)
    if @dogs.nil?
      collect(zip).sample
    else
      @dogs.sample
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
      else
        dog = Dog.find_by(petfinder_id: petfinder_dog.id)
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
