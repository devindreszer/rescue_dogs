class AddZipToDogQueries < ActiveRecord::Migration
  def change
    add_column :dog_queries, :zip, :text
  end
end
