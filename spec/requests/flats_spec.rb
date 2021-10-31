require 'rails_helper'

describe 'Flats-API', type: :request do
  describe 'GET /flats' do
    before do
      neighborhood1 = FactoryBot.create(:neighborhood, name: 'Neighborhood 1', coordinate_range: 'A-B')
      neighborhood2 = FactoryBot.create(:neighborhood, name: 'Neighborhood 2', coordinate_range: 'A-B')
      FactoryBot.create(:flat, name: 'Flat A', neighborhood: neighborhood1)
      FactoryBot.create(:flat, name: 'Flat A', neighborhood: neighborhood2)
    end

    it 'return all flats' do

      get '/api/v1/flats'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /flats' do
    it 'create a new flat' do
      expect {
        post '/api/v1/flats', params: {
          flat: {name: 'Flat X'}, 
          neighborhood: {name: 'Neighborhood 1', coordinate_range: 'X-Y'}
        }

      }.to change { Flat.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(Flat.count).to eq(1)
    end
  end

  describe 'DELETE /flats/:id' do
    neighborhood = FactoryBot.create(:neighborhood, name: 'Neighborhood 1', coordinate_range: 'A-B')
    let!(:flat) { FactoryBot.create(:flat, name: 'Flat Y', neighborhood: neighborhood)}
    it 'deletes a flat' do
      expect{
        delete "/api/v1/flats/#{flat.id}"
      }.to change {Flat.count}.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
