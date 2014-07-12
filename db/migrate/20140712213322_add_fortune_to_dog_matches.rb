class AddFortuneToDogMatches < ActiveRecord::Migration
  def change
    add_column :dog_matches, :fortune, :text
  end
end
