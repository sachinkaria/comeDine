class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
  :recoverable, :trackable, :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :tables

    # before_save -> do
    #   self.uid = SecureRandom.uuid
    #   skip_confirmation!
    # end
  end
