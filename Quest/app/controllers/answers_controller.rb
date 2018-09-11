class AnswersController < ApplicationController
  before_action :find_answerable

  def index
    @answer = Answer.all
  end

  def show
    
  end

  def new
    @answer = Answer.new
  end

  def create
    if !current_user then 
      redirect_to new_session_path, notice: 'You must be logged in to add a answer!'
    else
    @answer = @answerable.answers.new answer_params
    @answer.save 
    redirect_to @answer
    end
  end

  def destroy
  end



  def edit
  end

  private
  def answer_params
    params.require(:answer).permit(:text, :username, :question_id)
  end

  def find_answer_parent
    @answerable = Answer.find_by_id(params[:id])
  end
  def find_answerable
    
    @answerable= Answer.find_by_id(params[:answer_id]) if params[:answer_id]
    @answerable = question.find_by_id(params[:question_id]) if params[:question_id]
  end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:title, :body, :username)
    end
end
