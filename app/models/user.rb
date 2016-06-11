class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :trackable, :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :tables, dependent: :destroy
  has_many :bookings, dependent: :destroy



# before_save -> do
#   self.uid = SecureRandom.uuid
#   skip_confirmation!
# end
end
