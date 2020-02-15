class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    question = @answer.question
    @answer.save

    redirect_to topic_question_path(question.topic, question)
  end

  private

  def answer_params
    params.require(:answer).permit(:answer, :question_id, :user_id)
  end
end
