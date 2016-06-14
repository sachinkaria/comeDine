require "rails_helper"

describe ReviewsController, "testing reviews" do

  let(:json) { JSON.parse(response.body) }
  let(:new_review_params) { attributes_for(:review, comments: "Okay") }

  before(:each) do
    @sachin = create :user_with_review
    @table = @sachin.tables[0]
    @review = @table.reviews[0]
    @auth_headers = @sachin.create_new_auth_token
  end

  it "displays existing reviews", type: :request do
    get "/tables/#{@table.id}/reviews"
    expect(json[0]["comments"]).to eq(@review.comments)
  end

  it "allows user to create a review", type: :request do
    post "/tables/#{@table.id}/reviews.json", new_review_params, @auth_headers
    expect(Review.last.comments).to eq(new_review_params[:comments])
  end

  xit "only displays reviews belonging to table", type: :request do
    post "/tables/#{@table.id}/meals.json", new_meal_params, @auth_headers
    expect(Meal.last.menu).to eq(new_meal_params[:menu])
  end
end
