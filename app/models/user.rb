class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :tables

  def as_json(options={})
    super(only:  [:name,
                  :spaces,
                  :house_number,
                  :street,
                  :city,
                  :postcode])
  end
end