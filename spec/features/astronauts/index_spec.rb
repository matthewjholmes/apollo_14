require 'rails_helper'

RSpec.describe 'astronauts index' do
    before do 
        @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
        @astro2 = Astronaut.create!(name: "Astronaut 2", age: 33, job: "Janitor")
        @astro3 = Astronaut.create!(name: "Astronaut 3", age: 28, job: "Breath Holder")
    end

    describe 'as a visitor' do 
        describe 'when i visit /astronauts'
            before do 
                visit '/astronauts'
            end

            it 'i see list of astronauts with name, age, and job' do
                expect(current_path).to eq('/astronauts')

                expect(page).to have_content(@neil.name)
                expect(page).to have_content(@neil.age)
                expect(page).to have_content(@neil.job)
            end

            it 'i see the average age of all astronauts' do 
                # Average 32.666667, round to 33
                expect(page).to have_content("Average age: 33")
            end
        end
    end