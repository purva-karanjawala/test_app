class QuestionsController < ApplicationController
  before_action :set_topic, only: [:new, :create, :show]

  def show
    @question = @topic.questions.find(params[:id])
  end

  def new
    @question = @topic.questions.new
  end

  def edit
  end

  def create
    @question = @topic.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to topic_question_path(@topic, @question), notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to topic_question_path(@topic, @question), notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def question_params
      params.require(:question).permit(:question, :topic_id, :user_id)
    end
end
