include 'spec_helper'

feature 'As a user I can see a document' do
  let!(document) { create :document }
  before do
    visit "/"
  end
  scenario 'show document' do
    click_link(document.title)

    expect(page.body).to have_content(document.body)
  end
end
