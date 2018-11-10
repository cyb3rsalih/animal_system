# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do
    Animal.create({earring_no: Faker::IDNumber.valid, name: Faker::FunnyName.name,
                    state: Faker::FunnyName.name, animal_type: 0,
                    birthdate: "13/11/2018", gender: Faker::Gender.binary_type,
                    mating_date: "13/11/2018", mother_earring_no: Faker::IDNumber.valid
                })
end

30.times do
    Animal.create({earring_no: Faker::IDNumber.valid, name: Faker::FunnyName.name,
                    state: Faker::FunnyName.name, animal_type: 1,
                    birthdate: "13/11/2018", gender: Faker::Gender.binary_type,
                    mating_date: "13/11/2018", mother_earring_no: Faker::IDNumber.valid
                })
end

30.times do
    Animal.create({earring_no: Faker::IDNumber.valid, name: Faker::FunnyName.name,
                    state: Faker::FunnyName.name, animal_type: 2,
                    birthdate: "13/11/2018", gender: Faker::Gender.binary_type,
                    mating_date: "13/11/2018", mother_earring_no: Faker::IDNumber.valid
                })
end