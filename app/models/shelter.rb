class Shelter < ActiveRecord::Base
  has_many :dogs
  has_one :address

  def self.create_from_petfinder(petfinder_shelter)
    unless find_by(petfinder_id: petfinder_shelter.id).nil?
      @shelter = find_by(petfinder_id: petfinder_shelter.id)
    else
      @shelter = new
      @shelter.petfinder_id = petfinder_shelter.id
      @shelter.name = petfinder_shelter.name
      @shelter.phone = petfinder_shelter.phone
      @shelter.email = petfinder_shelter.email
      @shelter.url = "https://www.petfinder.com/shelters/#{petfinder_shelter.id}.html"
      @shelter.save
      @shelter.set_address(petfinder_shelter)
    end
    @shelter
  end

  def set_address(petfinder_shelter)
    create_address(
      street_line1: petfinder_shelter.address1,
      street_line2: petfinder_shelter.address2,
      city: petfinder_shelter.city,
      state: petfinder_shelter.state,
      zip: petfinder_shelter.zip
    )
  end

end
