class AddToColumnPost < ActiveRecord::Migration
  def up
  	add_column :posts ,:status ,:string
  end

  def down
  	add_column :posts ,:status 
  end
end
