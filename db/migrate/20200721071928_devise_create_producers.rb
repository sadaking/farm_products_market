# frozen_string_literal: true

class DeviseCreateProducers < ActiveRecord::Migration[5.2]
  def change
    create_table :producers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip


      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :producer_name, null: false
      t.string :producer_postal_code, null: false
      t.string :producer_prefecture_code, null: false
      t.string :producer_address_city, null: false
      t.string :producer_address_street, null: false
      t.string :producer_address_building
      t.boolean :admin, default: false

      t.timestamps null: false
    end

    add_index :producers, :email,                unique: true
    add_index :producers, :reset_password_token, unique: true
    # add_index :producers, :confirmation_token,   unique: true
    # add_index :producers, :unlock_token,         unique: true
  end
end
