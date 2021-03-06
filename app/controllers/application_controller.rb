class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_questions = user.questions.count
    @count_choice_answer = user.answers.count
    @count_answers = user.answers.count
  end
end
