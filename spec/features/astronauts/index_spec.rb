require 'rails_helper'

RSpec.describe 'astronauts index' do
    before do 
        @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
        @astro2 = Astronaut.create!(name: "Astronaut 2", age: 33, job: "Janitor")
        @astro3 = Astronaut.create!(name: "Astronaut 3", age: 28, job: "Breath Holder")

        @apollo13 = Mission.create!(title: "E Apollo 13", time_in_space: 5)
        @apollo14 = Mission.create!(title: "D Apollo 14", time_in_space: 10)
        @apollo15 = Mission.create!(title: "C Apollo 15", time_in_space: 15)
        @apollo16 = Mission.create!(title: "B Apollo 16", time_in_space: 20)
        @apollo17 = Mission.create!(title: "A Apollo 17", time_in_space: 25)

        @neil.missions << [@apollo13, @apollo14, @apollo15]
        @astro2.missions << [@apollo14, @apollo15, @apollo16]
        @astro3.missions << [@apollo15, @apollo16, @apollo17]

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

            it 'i see a list of missions in alpha order for each astronaut' do 
                expect(page).to have_content("Neil Armstrong Missions")
                expect(@apollo15.title).to appear_before(@apollo14.title)
                expect(@apollo14.title).to appear_before(@apollo13.title)
            end

            it 'i see total time in space for each astronaut' do 
                expect(page).to have_content ("Neil Armstrong Time in Space: 30")
            end
        end
    end