class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @questions = Question.all.order('created_at DESC').page(params[:page])
    end
  end
end
