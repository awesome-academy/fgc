class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :activity_id
      t.integer :activity_type
      t.integer :owner_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
