class HomeController < ApplicationController

  def show
    @total_views = Dog.all.map(&:view_count).compact.sum
    @user_count = User.all.count
    @dog_matches = DogQuery.where(is_match: true).count
    @dog_favorites = DogQuery.where(is_favorite: true).count
    @dog_top = DogQuery.where(is_top: true).count
  end

end
