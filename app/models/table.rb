class Table < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  belongs_to :user

    def as_json(options={})
      super(only:  [:id,
                    :name,
                    :spaces,
                    :house_number,
                    :street,
                    :city,
                    :postcode])
    end
  end
