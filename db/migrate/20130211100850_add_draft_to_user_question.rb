class AddDraftToUserQuestion < ActiveRecord::Migration
  def change
    add_column :user_questions, :is_draft, :boolean
  end
end
