class AddIsMatchToDogQueries < ActiveRecord::Migration
  def change
    add_column :dog_queries, :is_match, :boolean
  end
end
