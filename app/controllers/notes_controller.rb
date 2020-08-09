class NotesController < ApplicationController
  def index
    @notes = Note.where(user_id: session[:user_id])
    @user = current_user
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find_by(id: params[:id], user_id: session[:user_id])
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path }
      else
        format.html { redirect_to new_note_path, flash: { errors: @note.errors } }
      end
    end
  end

  def update
    @note = Note.find_by(id: params[:id], user_id: session[:user_id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to notes_path }
      else
        format.html { redirect_to new_note_path, notice: "The note could not be created"}
      end
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id], user_id: session[:user_id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_path, notice: 'Note was successfully destroyed.' }
    end
  end

  private

  def note_params
    fields = params.require(:note).permit(:title, :body)
    fields[:user] = session[:user_id]
    fields[:timestamp] = Time.new.to_i
    fields
  end
end
