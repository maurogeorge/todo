class NotesController < ApplicationController

  def index
    @note = Note.new
    fetch_notes
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      redirect_to root_path, notice: 'Nota criada com sucesso!'
    else
      fetch_notes
      render 'index'
    end
  end

  private

    def notes_params
      params.require(:note).permit(:content)
    end

    def fetch_notes
      @notes = Note.all
    end
end
