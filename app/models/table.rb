class Table < ActiveRecord::Base
  has_many :meals
  belongs_to :user

    def as_json(options={})
      super(only:  [:name,
                    :spaces,
                    :house_number,
                    :street,
                    :city,
                    :postcode])
    end
  end
