class CreateIssueVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :issue_votes do |t|
      t.integer :user
      t.integer :issue

      t.timestamps
    end
  end
end
