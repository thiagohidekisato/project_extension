class Project < ApplicationRecord
  belongs_to :professor
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
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
  validate  :picture_size


  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
