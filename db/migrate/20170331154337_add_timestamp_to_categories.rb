class AddTimestampToCategories < ActiveRecord::Migration
  def change
    change_table(:categories) { |t| t.timestamps }
  end
end
