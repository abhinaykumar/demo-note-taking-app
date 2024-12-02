class Note < ApplicationRecord
  belongs_to :notes_category
  belongs_to :user
  has_many :share_notes
  has_many :shared_with, through: :share_notes
end
