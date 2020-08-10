class NoteMailer < ApplicationMailer
  default from: "s.note.mailer@gmail.com"

  def note_email
    @note = Note.find_by(id: params[:id])
    @user = params[:user]
    mail(to: params[:email], subject: "#{@user.username} has sent you a note!")
  end
end
