# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_comment
  def new_comment
    UserMailer.new_comment(Comment.last.id)
  end

end
