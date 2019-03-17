class ChangeTypeOfUserField < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone_number, :string
    change_column :users, :description, :text
  end
end
