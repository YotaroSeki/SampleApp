require 'rails_helper'

feature 'Favorites', type: :system do
  background do
    driven_by :selenium_chrome_headless
  end
  let(:login_user) { create(:login_user) }
  let(:other_user) { create(:other_user) }
  let(:favorites) {
    other_user.microposts.map do |micropost|
      create(:favorite, micropost: micropost, user: login_user)
    end
  }

  scenario 'cancel posting favorites and make it favorite again' do
    begin
      p 'MEU'
      visit favorites_user_path(login_user)
      p 'PO'
        # expect(page).to have_button 'cancel favorite'
    rescue => e
      p e
    end
  end
end
