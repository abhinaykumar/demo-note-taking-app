class Note < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :notes_category
  belongs_to :user

  has_many :share_notes, dependent: :destroy
  has_many :shared_with, through: :share_notes
  has_rich_text :description

  after_update_commit -> {
    broadcast_replace_to 'notes',
      target: "#{dom_id(self)}_details",
      partial: 'notes/note'

    broadcast_replace_to 'shared-notes',
      target: "#{dom_id(self)}_shared_note",
      partial: 'notes/shared_note',
      locals: { shared_note: self }
  }

  after_destroy_commit -> {
    broadcast_remove_to 'notes',
      target: "#{dom_id(self)}_details",
      partial: 'notes/note'

    broadcast_remove_to 'shared-notes',
      target: "#{dom_id(self)}_shared_note",
      partial: 'notes/shared_note',
      locals: { shared_note: self }
  }
end
