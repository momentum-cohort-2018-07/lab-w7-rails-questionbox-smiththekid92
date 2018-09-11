class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    if !current_user then 
      redirect_to new_session_path, notice: 'You must be logged in to add a answer'
    else
    @answer= @Answerable.answers.new answer_params
    @answer.save 
    redirect_to @answer
    end
  end

  def destroy
  end

  def show
    find_answer_parent
    redirect_to "/stories/#{@answerable.story_id}"
  end

  def edit
  end

  private
  def answer_params
    params.require(:answer).permit(:text, :username, :story_id)
  end

  def find_answer_parent
    @answerable = answer.find_by_id(params[:id])
  end

  def find_answerable
    @answerable= answer.find_by_id(params[:answer_id]) if params[:answer_id]
    @commentable = Story.find_by_id(params[:story_id]) if params[:story_id]
  end
end
