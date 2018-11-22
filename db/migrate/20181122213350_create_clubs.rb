class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :email
      t.string :type

      t.timestamps
    end
  end
end
