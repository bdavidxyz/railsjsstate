class CreateHints < ActiveRecord::Migration[5.2]
  def change
    create_table :hints do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
