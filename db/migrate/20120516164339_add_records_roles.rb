class AddRecordsRoles < ActiveRecord::Migration
  def up
    role = Role.new(:name => "Twitter")
    role.save!
    role = Role.new(:name => "Admin")
    role.save!
  end

  def down
  end
end
