# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all
Book.destroy_all

author1 = Author.create({first_name: "Louis", last_name: "Smith"})
author2 = Author.create({first_name: "Katerine", last_name: "Liu"})

Book.create({
  title: "Kybalion", 
  author: author1,
  price: 1000,
  stock: 10
  })

Book.create({
  title: "The monk that sell the ferrari", 
  author: author2,
  price: 1500,
  stock: 8
  })