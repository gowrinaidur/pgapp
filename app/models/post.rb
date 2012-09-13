class Post < ActiveRecord::Base
  attr_accessible :comment, :post ,:status
  validates_presence_of :post ,:comment

end
