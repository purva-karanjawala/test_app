class UsersController < ApplicationController

  def index
    @questions = Question.includes(:topic, :user).all
  end

end
