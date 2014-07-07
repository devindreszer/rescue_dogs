class DogsController < ApplicationController

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    petfinder_dog = Dogfinder.new.random(params[:zip])

    unless Dog.find_by(petfinder_id: petfinder_dog.id).nil?
      @dog = Dog.find_by(petfinder_id: petfinder_dog.id)
    else
      @dog = Dog.new
      @dog.petfinder_id = petfinder_dog.id
      @dog.name = petfinder_dog.name
      @dog.image = petfinder_dog.photos.first.large
      @dog.size = petfinder_dog.size
      @dog.gender = petfinder_dog.sex
      @dog.age = petfinder_dog.age
      @dog.description = petfinder_dog.description
      @dog.url = "https://www.petfinder.com/petdetail/#{petfinder_dog.id}"
    end

    if @dog.save
      redirect_to dog_path(@dog.id)
    end
  end

end
