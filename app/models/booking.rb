class Booking < ActiveRecord::Base

  belongs_to :meal
  belongs_to :user
  after_initialize :init

  def init
      self.status  ||= "unconfirmed"
  end

  def as_json(options={})
    super(only:  [:user_id,
                  :meal_id,
                  :status,
                  :spaces])
    end
end
