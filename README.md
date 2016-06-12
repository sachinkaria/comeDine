### ComeDine (API)
#### Ruby on Rails

This is the server side of the [ComeDineApp](https://www.github.com/sachinkaria/comedineapp) using Ruby on Rails to create a restful API. This repository was build build on Test Driven Methods as well as SOLID principles. The API is designed be as simple as possible while the AngularJS and Ionic on the frontend handle the more complicated logic.


#### Model Structure

##### User
- has_many :tables
- has_many :bookings

##### Table
- belongs_to :user
- has_many :meals

##### Meal
- belongs_to :table
- belongs_to :user
- has_many :bookings

##### Booking
- belongs_to :meals
- belongs_to :user
