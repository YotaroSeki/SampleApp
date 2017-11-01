class ChangeColumnUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :email, false
  end
end
