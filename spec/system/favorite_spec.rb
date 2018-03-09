require 'rails_helper'

feature 'Favorites', type: :system do
  let(:login_user) { create(:login_user) }
  let(:other_user) { create(:other_user) }

  background do
    other_user.microposts.each do |micropost|
      login_user.favorite(micropost)
    end
    @favorite_count_at_the_start = Favorite.count.freeze
    login(login_user)
  end

  scenario 'cancel posting favorites and make it favorite again', js: true do
    visit favorites_user_path(login_user)

    expect(page).to have_button 'cancel favorite'
    expect(page).not_to have_css '.favorite-form'
    expect(all('.favorite-cancel-form').size).to eq @favorite_count_at_the_start

    first('.favorite-cancel-form').click_button 'cancel favorite'
    expect(page).to have_button 'favorite'
    expect(page).to have_content 'favorite canceled!'
    expect(Favorite.count).to eq @favorite_count_at_the_start - 1
    expect(all('.favorite-cancel-form').size).to eq @favorite_count_at_the_start - 1
    expect(all('.favorite-form').size).to eq 1

    click_button 'favorite'
    expect(page).not_to have_css '.favorite-form'
    expect(page).to have_content 'favorite succeed!'
    expect(Favorite.count).to eq @favorite_count_at_the_start
    expect(all('.favorite-cancel-form').size).to eq @favorite_count_at_the_start
  end

  after do
    page.driver.quit
  end
end
