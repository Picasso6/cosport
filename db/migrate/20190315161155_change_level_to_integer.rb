class ChangeLevelToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :level, :integer, using: 'level::integer'
  end
end
