require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validation tests' do
    it "ensures time presence" do
      event = Event.new(name: 'Evento', address: 'Rua Maria Quitéria, 68 Ipanema').save
      expect(event).to eq(false)
    end
    it "should save sucessfully" do
      event = create(:event)
      expect(event.valid?).to eq(true)
    end
  end
end
