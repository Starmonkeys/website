class ChangeTaskableToProject < ActiveRecord::Migration
  def self.up
    rename_column :tasks, :taskable_id, :project_id
    remove_column :tasks, :taskable_type
    add_column :tasks, :use_case_id, :integer
  end

  def self.down
    rename_column :tasks, :project_id, :taskable_id
    add_column :tasks, :taskable_type, :string
    remove_column :tasks, :use_case_id
  end
end
