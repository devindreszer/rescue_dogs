class HomeController < ApplicationController

  def show
    @user_count = User.all.count
    @dog_matches = DogMatch.all.count
    @dog_favorites = DogMatch.where(is_favorite: true).count
  end

end
