class FeedbacksController < ApplicationController
  layout 'dashboard'
  def new
  end

  def create
    @feedback = Feedback.create(feedback_params)
    flash[:notice] = "Thank you for your thoughtful feedback. Please allow 1-3 business days for our response."
    UserMailer.feedback_mail(current_user, @feedback).deliver
    redirect_to dashboard_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:description)
  end
end
