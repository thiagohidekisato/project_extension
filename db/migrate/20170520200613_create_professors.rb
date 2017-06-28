class CreateProfessors < ActiveRecord::Migration[5.1]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :ramal
      t.string :phone_cel
      t.string :specialization
      t.string :room
      t.string :lattes

      t.timestamps
    end
  end
end
