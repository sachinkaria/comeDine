require 'rails_helper'

describe User do
  it { is_expected.to have_many :tables}
end

describe UsersController, 'testing users' do

  let(:json) { JSON.parse(response.body) }
  let(:auth_error) {{"errors"=>["Authorized users only."]}}

  before(:each) do
    @sachin = create :user_with_table
    @table = @sachin.tables[0]
    @auth_headers = @sachin.create_new_auth_token
  end

  it 'displays existing tables', type: :request do
    get "/users/#{@sachin.id}", {}, @auth_headers
    expect(json[0]['house_number']).to eq(@table.house_number)
  end


  it 'does not show tables if user not signed in', type: :request do
    get "/users/#{@sachin.id}", {}, {}
    expect(json).to eq(auth_error)
  end
end
