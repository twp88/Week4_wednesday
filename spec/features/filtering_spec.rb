require 'spec_helper'

feature 'filtering tags' do
  scenario 'filters links by tag' do
    visit '/links/new'
    fill_in 'title', with: "Bubbles website"
    fill_in 'url', with: "https://bubblegame.org"
    click_button 'Submit'

    visit '/links/new'
    fill_in 'tag', with: 'bubbles'
#Fix this button
    click_button 'Search by tags'

    expect(page).to have_content("Bubbles website")
  end
end
