class CreateOpinions < ActiveRecord::Migration[5.2]
  def change
    create_table :opinions do |t|
      t.text :content
      t.references :recipient, index: true
      t.references :sender, index: true
      t.timestamps
    end
  end
end
