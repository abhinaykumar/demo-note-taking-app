class ChangeColumnTypeOnNote < ActiveRecord::Migration[8.0]
  def change
    change_column :notes, :description, :text
  end
end
