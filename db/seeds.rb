# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

country=Country.create!(country_name: 'India',country_code:'IN' )
state=State.create!(state_name: 'M.P',country_id:country.id )
city=City.create!(city_name: 'shivpuri',state_id:state.id )
role=UserRole.create!(role_name:'Admin')
company=Company.create!(name: 'TCS',country_id:country.id,state_id: state.id,city_id: city.id,postcode:'473751',active:'true')
place=Place.create!(place_name:'mp Nagar',company_id:company.id)
noge=Node.create!(node_name:'dada',place_id: place.id)
region=Region.create!(region_name:'East')
user=User.create!(first_name: 'Rahul',last_name:'jain',company_id:company.id,email: 'dr@gmail.com',password:'12345678',role_id:role.id,monthly_charge:'20000',image:'index.jpeg2',notes:'adadad',active:'true' 	)
#user_region=UserRegion.create!(user_id:user.id,region_id:user_region.id)
