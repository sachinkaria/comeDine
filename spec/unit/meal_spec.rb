require "rails_helper"

describe MealsController, "testing meals" do

  let(:json) { JSON.parse(response.body) }
  let(:new_meal_params) { attributes_for(:meal, menu: "Pizza") }

  before(:each) do
    @sachin = create :user_with_meal
    @table = @sachin.tables[0]
    @meal = @table.meals[0]
    @auth_headers = @sachin.create_new_auth_token
  end

  it "displays existing meals", type: :request do
    get "/"
    expect(json[0]["menu"]).to eq("Pasta")
  end

  it "allows user to create a meal", type: :request do
    post "/tables/#{@table.id}/meals.json", new_meal_params, @auth_headers
    expect(Meal.last.menu).to eq(new_meal_params[:menu])
  end

  it "only displays meals belonging to user", type: :request do
    post "/tables/#{@table.id}/meals.json", new_meal_params, @auth_headers
    expect(Meal.last.menu).to eq(new_meal_params[:menu])
  end

  it 'displays existing delivery requests', type: :request do
  get '/', {}, {}
  expect(json).to eq(auth_error)
end
end
