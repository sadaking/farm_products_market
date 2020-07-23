class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_index :users, :confirmation_token, unique: true

    add_column :producers, :confirmation_token, :string
    add_column :producers, :confirmed_at, :datetime
    add_column :producers, :confirmation_sent_at, :datetime
    add_column :producers, :unconfirmed_email, :string
    add_index :producers, :confirmation_token, unique: true

    # User.reset_column_information # Need for some types of updates, but not for update_all.
    execute("UPDATE users SET confirmed_at = NOW()")
    execute("UPDATE producers SET confirmed_at = NOW()")
  end
  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :users, :unconfirmed_email # Only if using reconfirmable

    remove_columns :producers, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :producers, :unconfirmed_email # Only if using reconfirmable
  end
end
