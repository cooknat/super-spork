# frozen_string_literal: true

class RemoveClubTypeFromClub < ActiveRecord::Migration[5.2]
  def change
    remove_column :clubs, :club_type, :string
  end
end
