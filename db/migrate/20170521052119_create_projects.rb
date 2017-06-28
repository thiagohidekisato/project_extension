class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :date_start
      t.string :date_finish
      t.boolean :fomento
      t.string :local
      t.string :images
      t.text :description
      t.integer :n_participants
      t.integer :v_volunteers
      t.integer :v_bolsistas
      t.text :perfil_volunteers
      t.references :professor, foreign_key: true

      t.timestamps
    end
    add_index :projects, [:professor_id, :created_at]
  end
end
