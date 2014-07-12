class HomeController < ApplicationController

  def show
    @total_views = Dog.all.map(&:view_count).compact.sum
    @user_count = User.all.count
    @dog_matches = DogMatch.all.count
    @dog_favorites = DogMatch.where(is_favorite: true).count
    @dog_top = DogMatch.where(is_top: true).count
  end

end
