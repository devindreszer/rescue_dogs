class RemoveLastZipFromDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :last_zip, :text
  end
end
