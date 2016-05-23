require "rails_helper"

describe TablesController, "testing tables" do
  before(:all) do
    FirstTable = Table.create(name: "First Table", spaces: 4, house_number: "14", street: "Badminton Close", city: "London", postcode: "UB54NA" )
    SecondTable = Table.create(name: "Second Table", spaces: 8, house_number: "12", street: "Whitechapel High Street", city: "London", postcode: "E25TU" )
  end

  it "displays existing tables", type: :request do
    get "/"
    json = JSON.parse(response.body)
    expect(json[0]["name"]).to eq("First Table")
    expect(json[1]["name"]).to eq("Second Table")
  end

  it "allows user to create a table", type: :request do
    params = {name: "Third Table", spaces: 6, house_number: "10", street: "Badminton Close", city: "London", postcode: "UB54NA"}
    post "/tables.json", params
    expect(Table.last.name).to eq(params[:name])
  end
end
