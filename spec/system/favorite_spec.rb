require 'rails_helper'

feature 'Favorites', type: :system do
  let(:login_user) { create(:login_user) }
  let(:other_user) { create(:other_user) }

  background do
    login_user.follow(other_user)
    other_user.follow(login_user)
    other_user.microposts.map do |micropost|
      login_user.favorite(micropost)
    end
  end

  scenario 'cancel posting favorites and make it favorite again', js: true do
    login(login_user)
    # visit favorites_user_path(login_user)
    #
    # expect(page).to have_button 'cancel favorite'
    sleep 5
    visit 'users/1/favorites'
    sleep 10
    visit 'users/1/favorites.jsonld'
    sleep 10
  end
end
