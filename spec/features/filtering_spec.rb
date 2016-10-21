require 'spec_helper'

feature 'filtering tags' do
  scenario 'filters links by tag' do
    visit '/links/new'
    fill_in 'title', with: "Bubbles website"
    fill_in 'url', with: "https://bubblegame.org"
    fill_in 'tag', with: 'bubbles'
    click_button 'Submit'
    click_button 'Add new link'
    fill_in 'title', with: "BBC News"
    fill_in 'url', with: "https://bbc.co.uk/news"
    fill_in 'tag', with: 'news'
    click_button 'Submit'


#Fix this button
    fill_in 'tag', with: 'bubbles'
    click_button 'Search by tags'

    expect(page).to have_content("Bubbles website")
  end
end
