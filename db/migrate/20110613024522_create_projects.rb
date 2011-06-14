class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :link
      t.integer :author_id

      t.timestamps
    end
    add_index :projects, :title, :unique => true
  end

  def self.down
    drop_table :projects
  end
end
