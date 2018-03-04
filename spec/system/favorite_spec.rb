require 'rails_helper'

feature 'Favorites', type: :system do
  let(:user) { create(:login_user) }

  scenario 'cancel posting favorites and make it favorite again' do
    begin
      p user
        # visit favorites_user_path(user)
    rescue => e
      p e
    end
  end
end
