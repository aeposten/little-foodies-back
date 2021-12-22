class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :first_name
      t.integer :age
      t.string :img_url
      t.integer :user_id
      t.timestamps
    end
  end
end
