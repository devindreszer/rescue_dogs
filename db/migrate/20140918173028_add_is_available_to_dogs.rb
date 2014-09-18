class AddIsAvailableToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :is_available, :boolean
  end
end
