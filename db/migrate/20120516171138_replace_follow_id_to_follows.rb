class ReplaceFollowIdToFollows < ActiveRecord::Migration
  def up
    remove_column :follows, :follow_id
    add_column :follows, :user_id, :integer
  end

  def down
  end
end
