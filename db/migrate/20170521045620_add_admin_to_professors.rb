class AddAdminToProfessors < ActiveRecord::Migration[5.1]
  def change
    add_column :professors, :admin, :boolean, default: false
  end
end
