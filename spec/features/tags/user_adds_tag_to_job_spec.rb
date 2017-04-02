require 'rails_helper'

RSpec.describe 'Tags' do
  scenario 'A user wants to add tags to a job' do
    tag1, tag2 = create_list(:tag, 2)
    job1, job2 = create_list(:job, 2)

    visit edit_job_path(job1)

    check("job_tags_1")
    check("job_tags_2")

    click_on("Update Job")

    expect(page).to have_link('Tag #1')
    expect(page).to have_link('Tag #2')
  end
end
