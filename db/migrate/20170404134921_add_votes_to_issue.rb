class AddVotesToIssue < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :votes, :int, :default => 0
  end
end
