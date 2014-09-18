class Dog < ActiveRecord::Base
  GENDERS = {"M" => "male", "F" => "female"}
  SIZES = {"S" => "small", "M" => "medium", "L" => "large"}
  belongs_to :shelter
  has_many :dog_queries, dependent: :destroy
  has_many :users, through: :dog_queries

  attr_accessor :zip_error

  def set_from_petfinder(petfinder_dog)
    self.petfinder_id = petfinder_dog.id
    self.name ||= petfinder_dog.name
    self.size ||= SIZES[petfinder_dog.size]
    self.gender ||= GENDERS[petfinder_dog.sex]
    self.age ||= petfinder_dog.age.downcase
    self.description ||= petfinder_dog.description
    self.url = "https://www.petfinder.com/petdetail/#{petfinder_dog.id}"

    if petfinder_dog.photos.present?
      self.image = petfinder_dog.photos.first.large
    else
      self.image = "/assets/images/no_image_available.png"
    end

    self
  end

  def random(zip, request_path)
    # Get all the random dogs from the database with the zip passed
    random_dogs = self.class.where(last_zip: zip)

    # check to see if there are enough dogs in the database with the zip passed
    # if not make an api request to collect more dogs in the database
    if random_dogs.nil? || random_dogs.count < Dogfinder::COUNT.to_i
      api_collect(random_dogs, zip)
      return self.zip_error if self.zip_error.present?
    end

    # Collect all of the unviewed random dogs
    unviewed_random_dogs = random_dogs.where(is_viewed: false)

    # if this is a new search or all of the dogs have been viewed
    # set all random dogs to unviewed
    if request_path == "/" || !unviewed_random_dogs.present?
      unview(random_dogs)
      unviewed_random_dogs = random_dogs.where(is_viewed: false)
    end

    # Sample an unviewed random dog from the collection with least views
    random_dog = unviewed_random_dogs.where(view_count: least_views(unviewed_random_dogs)).sample

    # Set the dog's viewed status to true
    random_dog.is_viewed = true

    # Add a view to the view count
    counter(random_dog)

    random_dog.save
    random_dog
  end

  private

  def api_collect(random_dogs, zip)
    dogfinder = Dogfinder.new
    random_dogs = dogfinder.collect(zip)

    # check for zip code errors after collect method is called
    self.zip_error = dogfinder.zip_error if dogfinder.zip_error.present?

    random_dogs
  end

  def unview(random_dogs)
    random_dogs.each do |random_dog|
      random_dog.is_viewed = false
      random_dog.save
    end
  end

  def least_views(random_dogs)
    view_counts = random_dogs.map(&:view_count).compact
    if view_counts.present?
      least_views = view_counts.min
    else
      least_views = nil
    end
  end

  def counter(random_dog)
    if random_dog.view_count.nil?
      random_dog.view_count = 1
    else
      random_dog.view_count += 1
    end
  end

end
