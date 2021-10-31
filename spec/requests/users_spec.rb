require 'rails_helper'

describe 'Users-API', type: :request do
  describe 'GET /users' do
    before do
      FactoryBot.create(:user, name: 'Agam', email: 'setiawanagam@gmail.com')
      FactoryBot.create(:user, name: 'Setiawan', email: 'agamsetiawan@gmail.com')
    end

    it 'return all users' do

      get '/api/v1/users'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /users' do
    it 'create a new user' do
      expect{
        post '/api/v1/users', params: {user: {name: 'User 1', email:'user1@crudstay.com'}}

      }.to change {User.count}. from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /users/:id' do
    let!(:user) { FactoryBot.create(:user, name: 'User X', email: 'userx@crudstay.com')}
    it 'deletes a user' do
      expect{
        delete "/api/v1/users/#{user.id}"
      }.to change {User.count}.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
