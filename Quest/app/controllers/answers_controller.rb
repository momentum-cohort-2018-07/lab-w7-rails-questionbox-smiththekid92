class AnswersController < ApplicationController

  def index
    @answers = Answer.page(params[:page])
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    redirect_to new_session_path, notice: 'You must be logged in to add a answer' if !current_user
    @answer = Answer.new
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(answer_params)

    if @answer.save
        redirect_to @answer
    else
        render 'new'
    end
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)

        redirect_to @answer
    else
        render 'edit'
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:title, :body, :username)
  end
end
