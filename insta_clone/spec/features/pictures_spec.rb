require 'rails_helper'
feature 'pictures' do
  context 'no pictures have been posted yet' do
    scenario 'should display a prompt to post a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end
  context 'picture has been posted' do
    before do
      visit '/pictures'
      click_link 'Post a picture'
      fill_in 'Caption', with: '#blessed'
      fill_in 'Location', with: 'London'
      page.attach_file('picture_image', './public/insta.jpg')
      click_button 'Create Picture'
    end
      scenario 'picture is posted' do
        expect(page).to have_content '#blessed'
        expect(page).to_not have_content 'No pictures yet'
        expect(page).to have_css("img[src*='insta.jpg']")
      end

      let!(:pic) {Picture.create(caption: "#moments", location: "Japan", image: File.open("#{Rails.root}/public/insta2.jpg" ))}
      scenario 'clicking on a pictures caption you see the full size image' do
        visit '/pictures'
        click_link '#moments'
        expect(page).to have_css("img[src*='insta2.jpg']")
        expect(page).to_not have_css("img[src*='insta.jpg']")
        expect(current_path).to eq "/pictures/#{pic.id}"
      end

      scenario 'a picture can be edited' do
        visit '/pictures'
        click_link 'Edit #moments'
        fill_in 'Caption', with: '#narcissist'
        fill_in 'Location', with: 'LA'
        click_button 'Update Picture'
        expect(page).to have_content '#narcissist'
        expect(page).to have_content 'LA'
        expect(page).to_not have_content '#moments'
        expect(page).to_not have_content 'Japan'
      end
      scenario 'a picture can be deleted' do
        visit '/pictures'
        click_link 'Delete #moments'
        expect(page).to_not have_content 'Delete #moments'
        expect(page).to_not have_content 'Japan'
        expect(page).to_not have_css("img[src*='insta2.jpg']")
        expect(page).to have_content '#moments deleted successfully'
      end
  end


end
