class CreatePostsubs < ActiveRecord::Migration[5.1]
  def change
    create_table :postsubs do |t|
      t.integer :sub_id
      t.integer :post_id

      t.timestamps
    end
  end
end
