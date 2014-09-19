class AddViewCountToDogQueries < ActiveRecord::Migration
  def change
    add_column :dog_queries, :view_count, :integer
  end
end
