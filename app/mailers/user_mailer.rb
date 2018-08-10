class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_comment.subject
  #
  def new_comment(comment_id)
    @comment = Comment.find(comment_id)
		to_email = @comment.post.user.email
		@by = @comment.user.email
		mail(
				to: to_email,
				subject: 'New Comment On Your Post'
			)
  end
end
