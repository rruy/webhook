class CreateIssue < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :action
      t.integer :repository_id
      t.string :repository_name
      t.string :owner_name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
