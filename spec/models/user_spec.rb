require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it "ensures last name presence" do
      user = User.new(email: 'sample@example.com', password: '123456', first_name: 'First', address: 'We Work Ipanema', birthday: '1940-07-22', gender: '1', latitude: -22.9841656, longitude: -43.2100433).save
      expect(user).to eq(false)
    end
    it "should save sucessfully" do
      user =  User.new(email: 'sample@example.com', password: '123456', first_name: 'First', last_name: 'Last', address: 'We Work Ipanema', birthday: '1940-07-22', gender: '1', latitude: -22.9841656, longitude: -43.2100433).save
      expect(user).to eq(true)
    end
  end
end
