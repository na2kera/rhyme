class HomeController < ApplicationController
  def index
    @quiz_names = Quiz.distinct.pluck(:name)
  end

  def show
    @quizzes = Quiz.where(name: params[:name])
  end

  def check_answer
    quiz = Quiz.find(params[:quiz_id])
    user_answer = params[:answer]

    if quiz.answer.downcase == user_answer.downcase
      flash[:notice] = "正解です！"
    else
      flash[:alert] = "不正解です。正解は「#{quiz.answer}」でした。"
    end

    redirect_to quiz_path(params[:name])
  end
end
