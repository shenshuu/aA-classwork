# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create(username: "Carlos", password: "Burgerz")
user2 = User.create(username: "Bob", password: "Kebab")
user3 = User.create(username: "Mike", password: "Sushi")

Cat.destroy_all
cat1 = Cat.create(name: "garfield", color: "orange", sex: "M" , birth_date: "01/02/2018", user_id: user1.id)
cat2 = Cat.create(name: "flook", color: "white", sex: "M" , birth_date: "07/02/2018", user_id: user1.id)
cat3 = Cat.create(name: "rose", color: "black", sex: "F" , birth_date: "01/02/2018", user_id: user2.id)