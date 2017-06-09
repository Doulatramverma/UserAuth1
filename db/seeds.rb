# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Company.create!(name: "TCS",country: 'India',state: 'M.P.',city:'Bhopal',postcode:'473751',startdate:'current_date',active:'true')
Country.create!(Countryname: 'India',Country code:'IN' )
State.create!(statename: 'M.P' )
City.create!(cityname: 'shivpuri' )
UserRole.create!(Rolename:'Admin')
Place.create!(Placename:'mp Nagar')
Region.create!(regionname:'East')
Region.create!(regionname:'East')
User.create!(FirstName: 'Rahul',Lastname:'jain',Email:'jain.rahul123@gmail.com',Company:'TCS',Role:'Admin',	Startdate:'',Enddate:'',MonthlyCharge:"20000",Notes:'adadad',Active:'true' 	)
