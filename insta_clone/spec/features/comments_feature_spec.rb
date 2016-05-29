require 'rails_helper'
feature 'Comments' do
  before {Picture.create(caption: "#moments", location: "Japan", image: File.open("#{Rails.root}/public/insta2.jpg" ))}
  context 'can be be added to pictures' do
    scenario 'posting a comment on a picture' do
    visit '/pictures'
    click_link 'Leave comment'
    fill_in 'Comment', with: 'Looks like a cheap hotel X'
    click_button 'Submit Comment'
    expect(page).to have_content 'Looks like a cheap hotel X'
    end
  end
end
