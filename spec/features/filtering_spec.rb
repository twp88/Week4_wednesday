require 'spec_helper'

feature 'filtering tags' do
  scenario 'filters links by tag' do
    visit '/links/new'
    fill_in 'title', with: "Bubbles website"
    fill_in 'url', with: "https://bubblegame.org"
    fill_in 'tag', with: 'bubbles'
    click_button 'Submit'

    visit '/tags/bubbles'
    expect(page).to have_content("Bubbles website")
  end
end
