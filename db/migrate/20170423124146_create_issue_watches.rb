class CreateIssueWatches < ActiveRecord::Migration[5.0]
  def change
    create_table :issue_watches do |t|
      t.integer :user
      t.integer :issue

      t.timestamps
    end
  end
end
