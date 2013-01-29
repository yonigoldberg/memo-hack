class UserBlog < ActiveRecord::Migration
  def up
    create_table :user_blogs do |t|
      t.references :user
      t.string :blog_name
      t.string :blog_url
      t.timestamps
    end

    add_index :user_blogs, :user_id, :unique

  end

  def down
    drop_table :user_blogs
  end
end
