class CreateUseCases < ActiveRecord::Migration
  def self.up
    create_table :use_cases do |t|
      t.string :description
      t.references :project
      t.integer :author_id

      t.timestamps
    end
  end

  def self.down
    drop_table :use_cases
  end
end
