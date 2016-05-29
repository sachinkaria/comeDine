require 'rails_helper'

describe User do
  it { is_expected.to have_many :tables}
end

describe UsersController, 'testing users' do

  let(:json) { JSON.parse(response.body) }

  before(:each) do
    @sachin = create :user_with_table
    @table = @sachin.tables[0]
    @auth_headers = @sachin.create_new_auth_token
  end

  it 'displays existing tables', type: :request do
    get "/users/#{@sachin.id}", {}, @auth_headers
    puts json
    expect(json[0]['house_number']).to eq(@table.house_number)
  end

end
