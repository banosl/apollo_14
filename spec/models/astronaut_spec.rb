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
    end

    it 'average_ages returns the average age of all astronauts' do
      expect(Astronaut.average_ages).to eq(47)
    end
  end
end
