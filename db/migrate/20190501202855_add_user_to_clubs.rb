# frozen_string_literal: true

class AddUserToClubs < ActiveRecord::Migration[5.2]
  def change
    add_reference :clubs, :user, foreign_key: true
  end
end
