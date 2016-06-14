class Review < ActiveRecord::Base

  belongs_to :table
  
  def as_json(options={})
    super(only:  [:comments,
      :rating_food,
      :rating_hygiene,
      :rating_atmosphere])
    end
  end
