# frozen_string_literal: true

class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :clubs, :type, :club_type
  end
end
