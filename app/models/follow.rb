class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :user, :foreign_key => :following_id
  belongs_to :twitt, :foreign_key => :user_id
end
