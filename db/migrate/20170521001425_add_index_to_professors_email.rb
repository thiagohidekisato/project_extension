class AddIndexToProfessorsEmail < ActiveRecord::Migration[5.1]
  def change
  	add_index :professors, :email, unique: true
  end
end
