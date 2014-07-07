class Dogfinder
  COUNT = "100"

  def random(zip)
    client.find_pets("dog", zip, count: COUNT).sample
  end

  private

  def client
    Petfinder::Client.new(ENV['PETFINDER_KEY'], ENV['PETFINDER_SECRET'])
  end

end
