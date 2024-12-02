class ShareNote < ApplicationRecord
  belongs_to :note
  belongs_to :shared_by, class_name: 'User'
  belongs_to :shared_with, class_name: 'User'

  after_create_commit -> {
    broadcast_append_to 'shared-notes', target: 'shared-notes',
                        partial: 'notes/shared_note',
                        locals: { shared_note: note }
  }
end
