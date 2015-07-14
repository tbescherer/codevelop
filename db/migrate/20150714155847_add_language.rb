class AddLanguage < ActiveRecord::Migration
  def change
    add_column :users, :language, :string, default: "none"
  end
end
