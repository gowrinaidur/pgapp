class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post
      t.string :comment

      t.timestamps
    end
  end
end
