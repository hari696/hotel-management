namespace :hotel_management do
  desc "Reset database"
  task reset_database: :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  end
  
  desc "Setup dummy data"
  task setup_dummy_data: :environment do
    puts "==== Started creating dummy data =================="
    current_time = Time.now
    next_one_hour = current_time + 1.hour
    today = Date.today
    tomorrow = today + 1

    customer = Customer.create!(name: 'Customer 1', email: 'customer1@customer.com', phone_number: '0987654321', address: 'Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522 (257) 563-7401')
    puts "==== Created Customers ================="

    hotel = Hotel.create!(name: 'Taj Hotels',
                          description: 'Taj Hotels is a chain of luxury hotels and a subsidiary of the Indian Hotels Company Limited; headquartered at Express Towers, Nariman Point in Mumbai. Incorporated by the founder of the Tata Group, Jamsetji Tata, in 1903, the company is a part of the Tata Group, one of India`s largest business conglomerates.', 
                          address: 'No: 234, TNHB, Sathuvachari, Vellore - 9', 
                          contact_number: '9098765432',
                          amenities: 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet',
                          hotel_pic: 'http://t1.gstatic.com/images?q=tbn:ANd9GcR7QFNZk3B1Kdp9IcaDRgv-CCZ4GVVUEPQv8CIxxDbhurbV-26N')
    puts "==== Created Hotel ====================="

    room1 = Room.create!(name: '2 bed with balcony', room_type: 'RWB', description: '2 beded room with balcony', max_adults: 2, max_children: 0, price: 2200, amenities: 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet', hotel: hotel)
    room2 = Room.create!(name: '4 bed with balcony', room_type: 'RWB', description: '2 beded room with balcony', max_adults: 2, max_children: 2, price: 4000, amenities: 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet', hotel: hotel)
    room3 = Room.create!(name: '1 bed with balcony', room_type: 'RWB', description: '1 beded room with balcony', max_adults: 1, max_children: 0, price: 1500, amenities: 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet', hotel: hotel)
    room4 = Room.create!(name: '1 bed without balcony', room_type: 'RWB', description: '1 beded room without balcony', max_adults: 1, max_children: 0, price: 1200, amenities: 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet', hotel: hotel)
    puts "==== Created Rooms ====================="

    booked_room = BookedRoom.create!(start_date: today, end_date: tomorrow, status: 'booked', check_in: current_time, check_out: next_one_hour, room: room2, customer: customer)
    puts "==== Created Booked rooms =============="
  end
end
