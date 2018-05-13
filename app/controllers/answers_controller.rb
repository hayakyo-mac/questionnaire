class AnswersController < ApplicationController
  before_action :require_user_logged_in

  def create
    choice = Choice.find_by_id(params[:answer_id])
    current_user.answers(choice)
    flash[:success] = '回答しました。'
    redirect_to root_url
  end
end
