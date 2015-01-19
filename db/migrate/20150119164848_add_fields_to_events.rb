class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :when, :string
    add_column :events, :where, :string
  end
end
