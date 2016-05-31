require 'rails_helper'
feature 'Likes' do
  before(:each) do
    user_sign_up
    post_picture_one
  end

  context 'image has no likes' do
    scenario 'can like a picture' do
      find('.image-link').click
      click_link 'Like'
      expect(page).to have_content '1 like'
    end
  end
end
