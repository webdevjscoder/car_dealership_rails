class AddBigIntToUsersUid < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :uid, :integer, limit: 5
  end
end
