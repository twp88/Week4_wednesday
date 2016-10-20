require 'spec_helper'
require './app/models/link.rb'

feature "adding links" do
  scenario "I would like to add sites address and a title" do
    visit '/links/new'
    fill_in('url', with: 'www.makersacademy.com')
    fill_in('title', with: 'Makers Academy')
    click_button('Submit')
    expect(page).to have_content('Makers Academy')
  end
end
