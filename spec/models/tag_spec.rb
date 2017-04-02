require 'rails_helper'

RSpec.describe Tag do
  describe 'validations' do
    it 'is invalid without a title' do
      tag = Tag.new

      expect(tag).to_not be_valid
    end

    it 'is invalid with a duplicate title' do
      Tag.create(title: 'original')
      tag = Tag.new(title: 'original')

      expect(tag).to_not be_valid
    end

    it 'is valid with a title' do
      tag = Tag.new(title: 'happy')

      expect(tag).to be_valid
    end
  end

  describe 'associations' do
    it 'has many jobs through taggings' do
      jobs = create_list(:job, 2)

      tag = Tag.create(title: 'hippo')
      tag.jobs << jobs

      expect(tag.jobs).to eq(jobs)
    end
  end



end
