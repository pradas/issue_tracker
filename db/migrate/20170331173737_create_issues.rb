class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :kind
      t.string :priority

      t.timestamps
    end
  end
end
