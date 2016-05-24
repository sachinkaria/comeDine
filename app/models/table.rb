class Table < ActiveRecord::Base
  has_many :meals

  def as_json(options={})
    super(only:  [:name,
                  :spaces,
                  :house_number,
                  :street,
                  :city,
                  :postcode])
    end
  end
