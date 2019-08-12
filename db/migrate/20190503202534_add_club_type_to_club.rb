# frozen_string_literal: true

class AddClubTypeToClub < ActiveRecord::Migration[5.2]
  def change
    add_reference :clubs, :club_type, foreign_key: true
  end
end
