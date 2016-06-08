require 'rails_helper'

describe User do
  it { is_expected.to have_many :tables}
end

describe UsersController, 'testing users' do

  let(:json) { JSON.parse(response.body) }
  let(:auth_error) {{"errors"=>["Authorized users only."]}}

  before(:each) do
    @sachin = create :user_with_meal
    @table = @sachin.tables[0]
    @meal = @table.meals[0]
    @auth_headers = @sachin.create_new_auth_token
  end

  it "gets a uid assigned" do
    expect(@sachin.uid).not_to be_blank
  end

  it 'displays existing tables for user', type: :request do
    get "/users/#{@sachin.id}", {}, @auth_headers
    expect(json[0]['house_number']).to eq(@table.house_number)
  end

  it 'displays existing meals for user', type: :request do
    get "/users/#{@sachin.id}", {}, @auth_headers
    # puts "#{json[1]["cuisine"]}"
    expect(json[1]["cuisine"]).to eq(@meal.cuisine)
  end


  it 'does not show tables if user not signed in', type: :request do
    get "/users/#{@sachin.id}", {}, {}
    expect(json).to eq(auth_error)
  end
end
