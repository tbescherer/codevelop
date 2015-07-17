class AddAbouttoUSers < ActiveRecord::Migration
  def change
    add_column :users, :about_field_one, :text
    add_column :users, :about_field_two, :text
    add_column :users, :about_field_three, :text
    add_column :users, :age, :integer
    add_column :users, :job, :string
    add_column :users, :looking_for, :text
  end
end
