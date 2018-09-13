require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      # need to sign in with user for it to work
      user = create(:user)
      event = create(:event)
      sign_in user

      get :show, params: { id: event.id }
      expect(response.status).to eq(200)
    end
  end

  context 'POST #create' do
    it 'returns a success response' do
      event = create(:event)
      # user = User.create!(email: 'sample@example.com', password: '123456', first_name: 'First', last_name: 'Last', address: 'We Work Ipanema', birthday: '1940-07-22', gender: '1', latitude: -22.9841656, longitude: -43.2100433)
      # user.event_id = event.id
      # user.save
      post :create
      expect(event.valid?).to eq(true)
    end
  end
end
