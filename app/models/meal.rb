class Meal < ActiveRecord::Base
  belongs_to :table

  def as_json(options={})
    super(only:  [:menu,
                  :date,
                  :time,
                  :places,
                  :cuisine])
    end
end
