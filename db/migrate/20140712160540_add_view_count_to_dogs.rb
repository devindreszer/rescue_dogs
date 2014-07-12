class AddViewCountToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :view_count, :integer
  end
end
