require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Model Methods' do
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

    it 'average_ages returns the average age of all astronauts' do
      expect(Astronaut.average_ages).to eq(47)
    end

    it 'sorts missions alphabetically' do
        expect(@astronaut_1.missions_alpha).to eq([@mission_2, @mission_3, @mission_1])
    end
  end
end
