# frozen_string_literal: true

class CreateClubTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :club_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
