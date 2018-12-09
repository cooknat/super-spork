class AddActiveToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :active, :boolean
  end
end
