class UserMailer < ApplicationMailer

  def feedback_mail(user, feedback)
    @user     = user
    @feedback = feedback
    mail(to: 'contact@getupexplore.com', subject: 'New Feedback')
  end

end
