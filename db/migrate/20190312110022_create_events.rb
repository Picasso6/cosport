class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.integer :duration

      t.belongs_to :sport
      t.belongs_to :city
      t.references :owner, index: true
      
      t.timestamps
    end
  end
end
