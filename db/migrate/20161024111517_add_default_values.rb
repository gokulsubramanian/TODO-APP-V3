class AddDefaultValues < ActiveRecord::Migration
  def up
  change_column :todos, :status, :string, :default => "open"
  change_column :todos, :notified, :string, :default => "no"
  end

  def down
  end
end
