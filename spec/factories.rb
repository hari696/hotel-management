FactoryGirl.define do
  factory :user do
    email 'admin@hotelmangement.com'
    password 'admin@123'
    password_confirmation 'admin@123'
    name 'Admin User'
  end
  
  factory :customer do
    name 'Customer 1'
    email 'customer1@customer.com'
    phone_number '0987654321'
    address 'Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522 (257) 563-7401'
  end
  
  factory :hotel do
    name "Taj Hotels"
    description "Taj Hotels is a chain of luxury hotels and a subsidiary of the Indian Hotels Company Limited; headquartered at Express Towers, Nariman Point in Mumbai. Incorporated by the founder of the Tata Group, Jamsetji Tata, in 1903, the company is a part of the Tata Group, one of India`s largest business conglomerates."
    address "No: 234, TNHB, Sathuvachari, Vellore - 9"
    contact_number "9098765432"
    amenities "Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet"
    hotel_pic "http://t1.gstatic.com/images?q=tbn:ANd9GcR7QFNZk3B1Kdp9IcaDRgv-CCZ4GVVUEPQv8CIxxDbhurbV-26N"
  end
  
  factory :room_one, class: Room do
    name '2 bed with balcony'
    room_type 'RWB'
    description '2 beded room with balcony'
    max_adults 2
    max_children 0
    price 2200
    amenities 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet'
    hotel
  end
  
  factory :room_two, class: Room do
    name '4 bed with balcony'
    room_type 'RWB'
    description '2 beded room with balcony'
    max_adults 2
    max_children 2
    price 4000
    amenities 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet'
    hotel
  end
  
  factory :room_thr, class: Room do
    name '1 bed with balcony'
    room_type 'RWB'
    description '1 beded room with balcony'
    max_adults 1
    max_children 0
    price 1500
    amenities 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet'
    hotel
  end
  
  factory :room_fou, class: Room do
    name '1 bed without balcony'
    room_type 'RWB'
    description '1 beded room without balcony'
    max_adults 1
    max_children 0
    price 1200
    amenities 'Free toiletries,Toilet Bath or shower,TV,Refrigerator,Kitchenette,Fan,Cable channels,Wardrobe or closet'
    hotel
  end
  
  factory :booked_room do
    start_date Date.parse('2020-10-01')
    end_date Date.parse('2020-10-10')
    status 'booked'
    check_in Time.now
    check_out Time.now + 1.hour
    room_id 1
    customer_id 1
  end
end
