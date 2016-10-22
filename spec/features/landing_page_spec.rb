require 'rails_helper'

RSpec.feature 'Landing page', type: :feature do
  scenario 'Visiting the Landing Page' do
    visit '/'

    expect(page).to have_content 'Crumbies'
  end
end
