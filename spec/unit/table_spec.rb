require "rails_helper"

describe TablesController, "testing tables" do

  let(:json) { JSON.parse(response.body) }

  before(:each) do
    @sachin = create :user_with_meal
    @table = @sachin.tables[0]
    @auth_headers = @sachin.create_new_auth_token
  end

  it "displays tables with existing meals", type: :request do
    get "/tables", {}, @auth_headers
    expect(json[0]["name"]).to eq("Sachins Restaurant")
  end

  it "allows user to create a table", type: :request do
    params = {name: "Third Table", spaces: 6, house_number: "10", street: "Badminton Close", city: "London", postcode: "UB54NA"}
    post "/tables.json", params, @auth_headers
    expect(Table.last.name).to eq(params[:name])
  end

end
