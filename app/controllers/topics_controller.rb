class TopicsController < ApplicationController
  before_action :set_user, only: [:new, :create, :show]

  def show
    @topic = @user.topics.find(params[:id])
  end

  def new
    @topic = @user.topics.new
  end

  def create
    @topic = @user.topics.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to user_topic_path(@user, @topic), notice: 'Topic was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def topic_params
      params.require(:topic).permit(:name, :user_id)
    end
end
