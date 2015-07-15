class Changeuseranswers < ActiveRecord::Migration
  def change
    remove_column :user_answers, :question_id
    rename_table :answers, :answer_choices
  end
end
