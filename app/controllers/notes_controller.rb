class NotesController < ApplicationController
  def index
    @notes = Note.where(user_id: session[:user_id])
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
        format.html { redirect_to notes_path, notice: "Note successfully created" }
      else
        format.html { redirect_to new_note_path, notice: "Unable to save note. Please make sure at least a title or body is provided." }
      end
    end
  end

  def update
    @note = Note.find_by(id: params[:id], user_id: session[:user_id])
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to notes_path, notice: "Note has been succesfully updated" }
      else
        format.html { redirect_to new_note_path, notice: "Unable to save note. Please make sure at least a title or body is provided." }
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

  def mail
  end

  def deliver
    respond_to do |format|
      format.html do
        NoteMailer.with(email: mail_params[:email], id: params[:id], user: @user).note_email.deliver_now
        redirect_to notes_path, notice: "Your email has been sent to #{mail_params[:email]}"
      end
    end
  end

  private

  def note_params
    fields = params.require(:note).permit(:title, :body)
    fields[:user] = session[:user_id]
    fields[:timestamp] = Time.new.to_i
    fields
  end

  def mail_params
    params.require(:mail).permit(:email)
  end
end
