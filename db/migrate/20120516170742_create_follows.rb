class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :follow_id
      t.integer :following_id

      t.timestamps
    end
  end
end
