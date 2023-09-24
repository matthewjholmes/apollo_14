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

  describe 'Methods' do
    before do 
      @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @astro2 = Astronaut.create!(name: "Astronaut 2", age: 33, job: "Janitor")
      @astro3 = Astronaut.create!(name: "Astronaut 3", age: 28, job: "Breath Holder")
    end

    it '#average_age' do
      expect(Astronaut.average_age).to eq(33)
    end
  end
end
