class Changeanswersid < ActiveRecord::Migration
  def change
    rename_column :user_answers, :answer_id, :answer_choice_id
  end
end
