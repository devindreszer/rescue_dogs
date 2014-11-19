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

    self.is_available = true

    self
  end

  def random(zip, request_path, user)
    matching_dog_queries = user.dog_queries.where(zip: zip)
    unviewed_dog_queries = matching_dog_queries.where(view_count: [0, nil])

    unless unviewed_dog_queries.present?
      offset = (matching_dog_queries.count / Dogfinder::COUNT.to_i) * Dogfinder::COUNT.to_i
      new_dogs = api_collect(zip, offset)

      if self.zip_error.present?
        return
      end

      add_dogs_to_user(new_dogs, user, zip)
      unviewed_dog_queries = matching_dog_queries.where(view_count: [0, nil])
    end

    first_dog_query = unviewed_dog_queries.first
    first_dog_query.counter

    random_dog = first_dog_query.dog

    # Add a view to the view count
    counter(random_dog)

    random_dog
  end

  private

  def api_collect(zip, offset)
    dogfinder = Dogfinder.new
    random_dogs = dogfinder.collect(zip, offset)

    # check for zip code errors after collect method is called
    self.zip_error = dogfinder.zip_error if dogfinder.zip_error.present?

    random_dogs
  end

  def add_dogs_to_user(dogs, user, zip)
    dogs.each do |dog|
      unless user.dogs.where(id: dog.id).present?
        user.dog_queries.create!(dog_id: dog.id, zip: zip)
      end
    end
  end

  def counter(random_dog)
    if random_dog.view_count.nil?
      random_dog.view_count = 1
    else
      random_dog.view_count += 1
    end
    random_dog.save
  end

end
