class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id
      t.integer :weight
      t.text :explanation
      t.timestamps
    end
    add_index :question_answers, :user_id
    add_index :question_answers, :question_id
    add_index :question_answers, :answer_id
  end
end
