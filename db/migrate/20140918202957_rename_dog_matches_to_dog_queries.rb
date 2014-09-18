class RenameDogMatchesToDogQueries < ActiveRecord::Migration
  def change
    rename_table :dog_matches, :dog_queries
  end
end
