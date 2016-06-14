require "rails_helper"

describe MealsController, "testing meals" do

  let(:json) { JSON.parse(response.body) }
  let(:new_meal_params) { attributes_for(:meal, menu: "Pizza") }
  let(:auth_error) {{"errors"=>["Authorized users only."]}}

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

  xit "only displays meals belonging to table", type: :request do
    post "/tables/#{@table.id}/meals.json", new_meal_params, @auth_headers
    expect(Meal.last.menu).to eq(new_meal_params[:menu])
  end
end
