require 'net/http'

desc "Set whether a dog is still available or not on petfinder"
task set_dog_availability: :environment do
  dogs = Dog.all
  dogs.each do |dog|
    res = Net::HTTP.get_response(URI(dog.image))
    if res.code == "415"
      dog.is_available = false
    else
      dog.is_available = true
    end
    dog.save
  end
end
