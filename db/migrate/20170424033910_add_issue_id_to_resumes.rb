class AddIssueIdToResumes < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :issue_id, :integer
  end
end
