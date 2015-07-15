class Changetables < ActiveRecord::Migration
  def change
    rename_table :question_answers, :user_answers
  end
end
