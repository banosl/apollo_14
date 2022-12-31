# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@astronaut_1 = Astronaut.create({name: "Neil Armstrong", age: 37, job: "Commander"})
        @astronaut_2 = Astronaut.create({name: "Mae Jemison", age: 66, job: "Astronaut"})
        @astronaut_3 = Astronaut.create({name: "Jonny Kim", age: 38, job: "Astronaut"})
        @mission_1 = Mission.create({title: "Gemini 7", time_in_space: 313})
        @mission_2 = Mission.create({title: "Apollo 13", time_in_space: 145})
        @mission_3 = Mission.create({title: "Capricorn 4", time_in_space: 214})
        @astronaut_mission_1 = AstronautMission.create({astronaut_id: @astronaut_1.id, mission_id: @mission_1.id})
        @astronaut_mission_2 = AstronautMission.create({astronaut_id: @astronaut_1.id, mission_id: @mission_2.id})
        @astronaut_mission_3 = AstronautMission.create({astronaut_id: @astronaut_1.id, mission_id: @mission_3.id})
        @astronaut_mission_4 = AstronautMission.create({astronaut_id: @astronaut_2.id, mission_id: @mission_1.id})
        @astronaut_mission_5 = AstronautMission.create({astronaut_id: @astronaut_2.id, mission_id: @mission_2.id})
        @astronaut_mission_6 = AstronautMission.create({astronaut_id: @astronaut_3.id, mission_id: @mission_2.id})
        @astronaut_mission_7 = AstronautMission.create({astronaut_id: @astronaut_3.id, mission_id: @mission_3.id})