class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :subject
      t.references :topic, foreign_key: true
      t.text :content
      t.references :user, foreign_key: true
      t.integer :view_count
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
