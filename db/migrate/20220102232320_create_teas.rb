class CreateTeas < ActiveRecord::Migration[6.1]
  def change
    create_table :teas do |t|
      t.string :tyep
      t.string :description
      t.string :temperature
      t.integer :brew_time

      t.timestamps
    end
  end
end
