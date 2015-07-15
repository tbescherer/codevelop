module Api
  class QuestionsController < ApiController

    def show
      @question = Question.find(params[:id])
      render :show
    end

    def index
      @questions = Question.all
      render json: @questions
    end
  end
end
