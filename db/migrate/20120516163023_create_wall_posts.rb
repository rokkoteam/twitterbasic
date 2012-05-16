class CreateWallPosts < ActiveRecord::Migration
  def change
    create_table :wall_posts do |t|
      t.integer :user_id
      t.integer :twitt_id

      t.timestamps
    end
  end
end
