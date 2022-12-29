require 'rails_helper'

RSpec.describe "Astronauts Index", type: :feature do
  describe 'as a user' do
    describe 'when I visit /astronauts' do
      before :each do
        @astronaut_1 = Astronaut.create({name: "Neil Armstrong", age: 37, job: "Commander"})
        @astronaut_2 = Astronaut.create({name: "Mae Jemison", age: 66, job: "Astronaut"})
        @astronaut_3 = Astronaut.create({name: "Jonny Kim", age: 38, job: "Astronaut"})
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

        expect(page).to have_content("Average ages of astronauts #{@astronauts.average_ages}")
      end

      it 'see list of space missions in alphabetical order for each astronaut'

      it 'see the total time in space for each astronaut'
    end
  end
end