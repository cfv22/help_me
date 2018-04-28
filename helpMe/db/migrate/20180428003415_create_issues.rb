class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :open

      t.timestamps
    end
  end
end
