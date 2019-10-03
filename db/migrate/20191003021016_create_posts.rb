class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :subject
      t.references :topics, foreign_key: true
      t.string :content
      t.references :users, foreign_key: true
      t.integer :view_count
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
