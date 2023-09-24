require 'rails_helper'

RSpec.describe 'astronauts index' do
    before do 
        @neil = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
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
        end
    end