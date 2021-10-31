require 'rails_helper'

describe 'Neighborhoods-API', type: :request do
  describe 'GET /neighborhoods' do
    before do
      FactoryBot.create(:neighborhood, name: 'Neighborhood 1', coordinate_range: 'X - Y')
      FactoryBot.create(:neighborhood, name: 'Neighborhood 2', coordinate_range: 'Y - Z')
    end

    it 'return all neighborhoods' do

      get '/api/v1/neighborhoods'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /neighborhoods' do
    it 'create a new neighborhood' do
      expect{
        post '/api/v1/neighborhoods', params: {neighborhood: {name: 'Neighborhood A', coordinate_range:'A - B'}}

      }.to change {Neighborhood.count}. from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /neighborhoods/:id' do
    let!(:neighborhood) { FactoryBot.create(:neighborhood, name: 'Neighborhood X', coordinate_range: 'C - D')}
    it 'deletes a neighborhood' do
      expect{
        delete "/api/v1/neighborhoods/#{neighborhood.id}"
      }.to change {Neighborhood.count}.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
