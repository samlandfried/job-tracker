class ChangeTimestampsOnCategories < ActiveRecord::Migration
  def change
    change_column_null :categories, :created_at, false
    change_column_null :categories, :updated_at, false
  end
end
