class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    remove_column :users,  :github_username
    remove_column :users, :twitter_username
  end
end
