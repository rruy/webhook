class AddColumnIssueIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :issue_id, :integer
  end
end
