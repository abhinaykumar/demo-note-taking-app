class CreateShareNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :share_notes do |t|
      t.references :note, null: false, foreign_key: true
      t.references :shared_by, null: false, foreign_key: { to_table: :users }
      t.references :shared_with, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
