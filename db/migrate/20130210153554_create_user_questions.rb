class CreateUserQuestions < ActiveRecord::Migration
  def change
    create_table :user_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :location
      t.date :occured

      t.timestamps
    end
  end
end
