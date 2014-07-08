class Dog < ActiveRecord::Base
  belongs_to :shelter
  has_many :dog_matches, dependent: :destroy
  has_many :users, through: :dog_matches

  def set_from_petfinder(petfinder_dog)
    self.petfinder_id = petfinder_dog.id
    self.name = petfinder_dog.name
    self.image = petfinder_dog.photos.first.large
    self.size = petfinder_dog.size
    self.gender = petfinder_dog.sex
    self.age = petfinder_dog.age
    self.description = petfinder_dog.description
    self.url = "https://www.petfinder.com/petdetail/#{petfinder_dog.id}"
    self
  end

end
