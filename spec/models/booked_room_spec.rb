require 'rails_helper'

RSpec.describe BookedRoom, type: :model do
  describe 'Default validations' do
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:status) }
  end
  
  describe 'Checking booking creation condition' do
    before :each do
      @customer = FactoryGirl.create(:customer)
      @hotel = FactoryGirl.create(:hotel)
      @room1 = FactoryGirl.create(:room_one, hotel_id: @hotel.id)
      @booked_room = FactoryGirl.create(:booked_room, room_id: @room1.id, customer_id: @customer.id)
    end
    
    it "should return error by validating unique room booking on same date" do
      new_booking = BookedRoom.new(start_date: Date.parse('2020-10-01'), end_date: Date.parse('2020-10-10'), status: 'booked', room_id: @room1.id, customer_id: @customer.id)
      new_booking.save
      expect(new_booking.errors.full_messages).to eq(["Room has already been taken"])
    end
  end
end
