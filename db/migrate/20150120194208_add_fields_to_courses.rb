class AddFieldsToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :speaker, index: true
    add_column :courses, :date, :string
  end
end
