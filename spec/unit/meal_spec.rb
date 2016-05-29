require "rails_helper"

describe MealsController, "testing meals" do
  before(:all) do
    @table = Table.create(name: "First Table", spaces: 4, house_number: "14", street: "Badminton Close", city: "London", postcode: "UB54NA" )
    FirstMeal = @table.meals.create(menu: "Pasta", date: "2015-06-06", time: "20:00", places: 4, cuisine: "Italian" )
    SecondMeal = @table.meals.create(menu: "Pizza", date: "2015-07-07", time: "20:00", places: 2, cuisine: "Italian" )
  end

  it "displays existing meals", type: :request do
    get "/"
    json = JSON.parse(response.body)
    expect(json[0]["menu"]).to eq("Pasta")
    expect(json[1]["menu"]).to eq("Pizza")
  end

  it "allows user to create a meal", type: :request do
    params = {menu: "Fish and Chips", date: "2015-07-07", time: "20:00", places: 2, cuisine: "English"}
    post "/tables/#{@table.id}/meals.json", params
    expect(Meal.last.menu).to eq(params[:menu])
  end
end
