class AddWatchersToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :watchers, :integer
  end
end
