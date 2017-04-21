class AddStatusToIssue < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :status, :string, :default => 1
  end
end
