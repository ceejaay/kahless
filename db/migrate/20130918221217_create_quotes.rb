class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :text
      t.boolean :authorized

      t.timestamps
    end
  end
end
