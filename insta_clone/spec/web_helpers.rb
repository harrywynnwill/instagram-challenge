def post_picture_one
  click_link "Post a picture"
  fill_in 'Caption', with: '#blessed'
  fill_in 'Location', with: 'London'
  attach_file 'picture[image]', Rails.root + "spec/assets/insta.jpg"
  click_button 'Create Picture'
end
def post_picture_two
  click_link "Post a picture"
  fill_in 'Caption', with: '#moments'
  fill_in 'Location', with: 'Japan'
  attach_file 'picture[image]', Rails.root + "spec/assets/insta2.jpg"
  click_button 'Create Picture'
end
def post_picture_three
  click_link "Post a picture"
  fill_in 'Caption', with: '#peoplearepeople'
  fill_in 'Location', with: 'Japan'
  attach_file 'picture[image]', Rails.root + "spec/assets/insta2.jpg"
  click_button 'Create Picture'
end
def user_sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end
