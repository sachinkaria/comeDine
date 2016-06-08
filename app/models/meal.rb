class Meal < ActiveRecord::Base
  belongs_to :table
  has_many :bookings

  def as_json(options={})
    super(only:  [:menu,
                  :date,
                  :time,
                  :places,
                  :cuisine,
                  :id,
                  :table_id])
    end
end
