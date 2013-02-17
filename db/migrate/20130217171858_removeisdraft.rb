class Removeisdraft < ActiveRecord::Migration
  def up
  	remove_column :user_questions, :is_draft
  end

  def down
  end
end
