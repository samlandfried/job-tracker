require 'rails_helper'

RSpec.describe 'Tag' do
  scenario 'a user wants to see a tag and its jobs' do
    jobs = create_list(:job, 2)
    create(:tag, title: 'test tag', jobs: jobs)

    visit tags_path

    click_on('Test Tag')

    save_and_open_page

    within('h1') do
      expect(page).to have_content('Test Tag')
    end

    within('ul') do
      expect(page).to have_link('Plumber #1')
      expect(page).to have_link('Plumber #2')
    end
  end
end
