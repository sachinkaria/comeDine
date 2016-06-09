require "rails_helper"

describe BookingsController, "testing bookings" do

  let(:json) { JSON.parse(response.body) }

  before(:each) do
    @chef = create :user_with_meal
    @customer = create :user, email: "customer@customer.com"
    @table = @chef.tables[0]
    @meal = @table.meals[0]
    @auth_headers = @customer.create_new_auth_token
    @booking = @customer.bookings.create(user_id: @customer.id, meal_id: @meal.id, spaces: 2)
  end

  it "displays existing bookings for user", type: :request do
    get "/bookings", {}, @auth_headers
    expect(json["spaces"]).to eq(2)
  end

  it "allows user to create a booking", type: :request do
    params = {user_id: @customer.id, meal_id: @meal.id, spaces: 3}
    post "/bookings.json", params, @auth_headers
    expect(Booking.last.spaces).to eq(params[:spaces])
  end

  it "booking status is unconfirmed", type: :request do
    expect(@booking.status).to eq("unconfirmed")
  end

end
