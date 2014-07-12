class AddIsViewedToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :is_viewed, :boolean
  end
end
