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

  describe 'Class Methods' do
    before do 
      @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @astro2 = Astronaut.create!(name: "Astronaut 2", age: 33, job: "Janitor")
      @astro3 = Astronaut.create!(name: "Astronaut 3", age: 28, job: "Breath Holder")
    end

    it '.average_age' do
      expect(Astronaut.average_age).to eq(33)
    end
  end

  describe 'Instance Methods' do
    before do 
      @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")

      @mission_a = Mission.create!(title: "A", time_in_space: 5)
      @mission_b = Mission.create!(title: "B", time_in_space: 10)
      @mission_c = Mission.create!(title: "C", time_in_space: 15)
    
      @neil.missions << [@mission_c, @mission_b, @mission_a]
    end

    it '#alpha_missions' do
      expect(@neil.alpha_missions).to eq([@mission_a, @mission_b, @mission_c])
    end

    it '#time_in_space' do      
      expect(@neil.time_in_space).to eq(30)
    end
  end
end
