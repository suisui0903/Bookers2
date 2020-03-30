class AddUsernameToUser < ActiveRecord::Migration[5.2]
    def change
        add_column :users, :username, :string, :unique => true, :null => false, :default => ""
    end
end
