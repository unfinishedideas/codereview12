# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    Park.destroy_all
    seed = Seed.new
    seed.generate_parks
  end

  def generate_parks
    uniquer = 0;
    20.times do |i|
      park = Park.create!(
        name: "#{uniquer}_" + Faker::Movies::LordOfTheRings.location,
        state: Faker::Team.state,
        national: [true, false].sample
      )
      puts "Park #{i}: Name is #{park.name}, is located in '#{park.state}'. Is it a national park? #{park.national}"
      uniquer += 1
    end
  end
end

Seed.begin
