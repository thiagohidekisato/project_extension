class Professor < ApplicationRecord
  has_many :projects, dependent: :destroy
  before_save { self.email = email.downcase }

  include PgSearch
  multisearchable :against => [:name, :specialization]

	VALID_NAME_REGEX = /\A^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+\z/
	#validates :name,  presence: true, length: { maximum: 50 },
			#format: { with: VALID_NAME_REGEX }
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
			format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	#VALID_NUMBER_PHONE_REGEX = /\A\([0-9]{2}\)\s[0-9]{4}-[0-9]{4}\z/
	validates :phone, presence: true#, format: { with: VALID_NUMBER_PHONE_REGEX }
	VALID_NUMBER_REGEX = /\A[0-9]+\z/
	validates :ramal, presence: false, format: { with: VALID_NUMBER_REGEX }
	#VALID_NUMBER_PHONE_CEL_REGEX = /\A(\([0-9]{2}\)\s[0-9]{5}-[0-9]{4})?\z/
	validates :phone_cel, presence: false#, format: { with: VALID_NUMBER_PHONE_CEL_REGEX }
	validates :specialization, presence: true#, format: { with: VALID_NAME_REGEX }
	validates :room, presence: true, format: { with: VALID_NUMBER_REGEX }
	validates :lattes, presence: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	# Returns the hash digest of the given string.
  	def Professor.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end

end
