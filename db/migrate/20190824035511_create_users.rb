# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false
      t.string :password_digest,    null: false

      # added confirmation logic if needed

      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      t.timestamps
    end
  end
end
