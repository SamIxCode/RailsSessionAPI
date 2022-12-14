class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :record_name ,null: false
      t.string :record_info ,null: false

      t.timestamps
    end
  end
end
