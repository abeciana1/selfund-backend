# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "delete all"
User.destroy_all
Expense.destroy_all
Goal.destroy_all
Income.destroy_all
Saving.destroy_all

puts "create users"
alex = User.create(name: "Alex", email: "test@test.com", password: "1234")
10.times do
    User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "password")
end

puts "create expenses"
Expense.create(source_name: "NetFlix", rate: "monthly", amount: 17.99, user_id: alex.id)
10.times do
    Expense.create(source_name: "Test Expense", rate: ["monthly", "weekly", "bi-weekly", "annually", "one-time"].sample, amount: rand(9.99..23.94).round(2), user_id: User.all.sample.id)
end

puts "create goals"
Goal.create(name: "Oculus Quest 2", goal_amount: 300.00, description: "Cool VR headset", user_id: alex.id)
10.times do
    Goal.create(name: "Fake Goal", goal_amount: 1000.00, description: "Fake Description -- Planning for something big", user_id: User.all.sample.id)
end

puts "create income"
Income.create(source_name: "Testing Income", amount: 1000.00, rate: "weekly", user_id: alex.id)
10.times do
    Income.create(source_name: "Fake Income", amount: rand(500.00..1000.00).round(2), rate: ["weekly", "bi-weekly", "one-time"].sample, user_id: User.all.sample.id)
end

puts "create savings"
Saving.create(name: "General Savings", bank_name: "Monopoly", amount: 6000.00, category: "Savings Account", user_id: alex.id)
10.times do 
    Saving.create(name: "Fake Savings", bank_name: "Fake Bank", amount: rand(10000.00..20000.00).round(2), category: "Savings Account", user_id: User.all.sample.id)
end

puts "all seeded"