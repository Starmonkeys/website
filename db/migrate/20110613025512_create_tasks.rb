class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :location
      t.integer :difficulty
      t.integer :author_id
      t.integer :owner_id
      t.references :taskable
      t.string :taskable_type
      t.datetime :done

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
