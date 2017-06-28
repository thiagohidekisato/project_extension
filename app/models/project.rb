class Project < ApplicationRecord
  belongs_to :professor
  default_scope -> { order(created_at: :desc) }
  validates :professor_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :date_start, presence: true, length: { maximum: 10 }
  validates :date_finish, presence: false, length: { maximum: 10 }
  validates :local, presence: true, length: { maximum: 50 }
  validates :images, presence: false, length: { maximum: 255 }
  validates :description, presence: true#, length: { maximum: 255 }
  validates :n_participants, presence: true
  validates :v_volunteers, presence: true
  validates :v_bolsistas, presence: true
  validates :perfil_volunteers, presence: true

end