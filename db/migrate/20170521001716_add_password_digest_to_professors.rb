class AddPasswordDigestToProfessors < ActiveRecord::Migration[5.1]
  def change
    add_column :professors, :password_digest, :string
  end
end
