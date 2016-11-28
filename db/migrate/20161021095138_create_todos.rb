class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :desc
      t.string :priority
      t.datetime :deadline
      t.integer :reminder
      t.string :status
      t.string :notify
      t.string :notified

      t.timestamps
    end
  end
end
