require 'rails_helper'

RSpec.describe "Astronauts Index", type: :feature do
  describe 'as a user' do
    describe 'when I visit /astronauts' do
      before :each do
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
      end
     
      it 'see a list of astronauts with name, age, job' do
        visit "/astronauts"

        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_3.name)
        expect(page).to have_content("Age: #{@astronaut_2.age}")
        expect(page).to have_content("Age: #{@astronaut_3.age}")
        expect(page).to have_content("Job: #{@astronaut_1.job}")
        expect(page).to have_content("Job: #{@astronaut_2.job}")
        expect(page).to_not have_content("Apple Pie Baker")
      end

      it 'see average age of all astronauts' do
        visit "/astronauts"

        expect(page).to have_content("Average ages of astronauts: #{Astronaut.average_ages}")
      end

      describe 'alphabet method' do
        let(:mission_1) {"#{@mission_1.title}"}
        let(:mission_2) {"#{@mission_2.title}"}
        let(:mission_3) {"#{@mission_3.title}"}

        it 'see list of space missions in alphabetical order for each astronaut' do
          visit "/astronauts"

          save_and_open_page
          within ("#astronaut-#{@astronaut_1.id}") do
          expect(mission_2).to appear_before(mission_1)
          expect(mission_1).to_not appear_before(mission_2)
          expect(mission_1).to_not appear_before(mission_3)
          end
        end
      end

      it 'see the total time in space for each astronaut'
    end
  end
end