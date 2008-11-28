class CreateTodoItems < ActiveRecord::Migration
  def self.up
    create_table :todo_items do |t|
      t.integer :todo_list_id
      t.integer :person_id
      t.string :text
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :todo_items
  end
end
