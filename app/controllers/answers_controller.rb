class AnswersController < ApplicationController
  before_action :require_user_logged_in

  def create
    @answer = current_user.answers.new
    @answer.choice_id = answer_params[:choice]
    @answer.save
    flash[:success] = '回答しました。'
    redirect_to root_url
  end

  private

  def answer_params
    params.require(:answer).permit(:choice)
  end
end