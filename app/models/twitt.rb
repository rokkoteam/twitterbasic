class Twitt < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :post

end
