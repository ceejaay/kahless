class AddDefaultValueToShowAttribute < ActiveRecord::Migration
  def change
    change_column :quotes, :authorized, :boolean, :default => false
  end
end
