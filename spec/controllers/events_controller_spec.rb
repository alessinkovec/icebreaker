require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  # context 'GET #show' do
  #   it 'returns a success response' do
  #     user = User.create!(email: 'sample@example.com', password: '123456', first_name: 'First', last_name: 'Last', address: 'We Work Ipanema', birthday: '1940-07-22', gender: '1', latitude: -22.9841656, longitude: -43.2100433)
  #     get :show, params: { id: user.to_param }
  #     expect(response).to be_successful
  #   end
  # end
end
