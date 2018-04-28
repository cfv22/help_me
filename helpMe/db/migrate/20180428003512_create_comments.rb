class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :issue_id, foreign_key: true
      t.references :user_id, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
