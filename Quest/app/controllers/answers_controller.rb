class AnswersController < ApplicationController
  before_action :find_answerable

  def new
    @answer = Answer.new
  end

  def create
    if !current_user then
      redirect_to new_session_path, notice: 'You must be logged in to add an answer'
    else
      @answer = @answerable.answer.new answer_params
      @answer.save
      redirect_to @answer
  end

  def destroy
  end

  def show
    find_answer_parent
    redirect_to "/questions/#{@answerable.question_id}"
  end

  def edit
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :body, :username, :question_id)
  end

  def find_answerable_parent
    @answerable = Answer.find_by_id(params[:id])
  end

  def find_answerable
    @commentable = Answer.find_by_id(params[:answer_id]) if params[:answer_id]
    @commentable = Question.find_by_id(params[:question_id]) if params[:question_id]
  end

end
