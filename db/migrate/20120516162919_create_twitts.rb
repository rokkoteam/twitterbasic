class CreateTwitts < ActiveRecord::Migration
  def change
    create_table :twitts do |t|
      t.integer :user_id
      t.text :post

      t.timestamps
    end
  end
end
