require 'rails_helper'

RSpec.describe 'Tags' do
  scenario 'user wants to edit a tag' do
    tag = create(:tag)

    visit tags_path

    click_on('Edit')

    fill_in 'tag_title', with: 'Tag #Infinity'

    click_on 'Update Tag'

    within('h1') do
      expect(page).to have_content('Tag #Infinity')
    end
  end
end