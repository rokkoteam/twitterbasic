class AddAdminUserToUsers < ActiveRecord::Migration
  def change
    usr = User.new(:email => "admin@admin.com",:password => "123456", :role_id => 2)
    usr.save!
  end
end
