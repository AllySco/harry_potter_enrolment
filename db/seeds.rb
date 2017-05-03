require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry-byebug')


house1 = House.new({
  "name" => "Gryfindor"
  })

house2 = House.new({
  "name" => "Slytherin"
  })

house3 = House.new({
  "name" => "Ravenclaw"
  })

house4 = House.new({
  "name" => "Hufflepuff"
  })

house1.save
house2.save
house3.save
house4.save

student1 = Student.new({
  "first_name" => "Derek",
  "second_name" => "Trotter",
  "age" => 15,
  "house_id" => house3.id
  })

student1.save()

student2 = Student.new({
  "first_name" => "Rodney",
  "second_name" => "Trotter",
  "age" => 12,
  "house_id" => house2.id
  })

student2.save()

binding.pry
nil