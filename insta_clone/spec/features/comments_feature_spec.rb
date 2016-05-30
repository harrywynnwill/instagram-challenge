require 'rails_helper'
feature 'Comments' do
  before do
    user_sign_up
    post_picture_three
  end
  context 'can be be added to pictures' do
    scenario 'posting a comment on a picture' do
    click_link 'Leave comment'
    fill_in 'Comment', with: 'Looks like a cheap hotel X'
    click_button 'Submit Comment'
    expect(page).to have_content 'Looks like a cheap hotel X'
    end
  end
end
