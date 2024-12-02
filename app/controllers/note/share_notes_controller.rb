class Note::ShareNotesController < ApplicationController
  def create
    @share_note = ShareNote.new(share_note_params)
  end

  private

  def share_note_params
    params.expect(:note_id, :shared_by_id, :shared_with_id)
  end
end
