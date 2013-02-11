class AddDetailsToUserQuestion < ActiveRecord::Migration
  def change
    add_column :user_questions, :tumblr_id, :string
  end
end
