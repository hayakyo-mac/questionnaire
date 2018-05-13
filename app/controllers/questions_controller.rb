class QuestionsController < ApplicationController

  def show
      @question = Question.find(params[:id])
      @choices = @question.choices
  end

  def new
      @question = current_user.questions.new
      @choice1 = @question.choices.new
      @choice2 = @question.choices.new
      @choice3 = @question.choices.new
      @choice4 = @question.choices.new
  end

  def create
      Rails.logger.info(params)
      @question = current_user.questions.new(question_params)
      @choice1 = @question.choices.new(choice1_params)
      @choice2 = @question.choices.new(choice2_params)
      @choice3 = @question.choices.new(choice3_params)
      @choice4 = @question.choices.new(choice4_params)

    if @question.save && @choice1.save && @choice2.save && @choice3.save && @choice4.save
      flash[:success] = 'アンケートを設定しました。'
      redirect_to @question
    else
      flash.now[:danger] = 'アンケートの設定に失敗しました。'
      render :new
    end
  end

  def answer
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private
  
  def question_params
    params.require(:question).permit(:content)
  end
  
  def choice1_params
    params.require(:choice1).permit(:content)
  end
  
  def choice2_params
    params.require(:choice2).permit(:content)
  end

  def choice3_params
    params.require(:choice3).permit(:content)
  end
  
  def choice4_params
    params.require(:choice4).permit(:content)
  end

end