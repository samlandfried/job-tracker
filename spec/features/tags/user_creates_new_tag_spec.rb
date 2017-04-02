require 'rails_helper'

RSpec.describe 'Tags' do
  scenario 'a user creates a new tag' do
    visit new_tag_path

    fill_in 'tag_title', with: 'Dagney Tagger'
    click_on 'Create Tag'

    expect(page).to have_link('Dagney Tagger')
  end
end
