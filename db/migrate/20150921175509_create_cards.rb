class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :expiration
      t.integer :month
      t.integer :year

      t.timestamps null: false
    end
  end
end
