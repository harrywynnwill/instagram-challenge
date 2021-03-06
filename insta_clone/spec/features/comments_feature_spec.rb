require 'rails_helper'
feature 'Comments' do
  before do
    user_sign_up
    post_picture_three
  end
  context 'can be be added to pictures' do
    scenario 'posting a comment on a picture' do
    click_link '#peoplearepeople'
    fill_in 'Comment', with: 'Looks like a cheap hotel X'
    click_button 'Submit Comment'
    click_link '#peoplearepeople'
    expect(page).to have_content 'Looks like a cheap hotel X'
    end
  end
end
