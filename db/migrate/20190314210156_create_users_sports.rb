class CreateUsersSports < ActiveRecord::Migration[5.2]
  def change
    create_table :users_sports do |t|

      t.belongs_to :user, index: true
      t.belongs_to :sport, index: true
      t.string :level_user

      t.timestamps
    end
  end
end
