module Api
  class QuestionsController < ApiController

    def show
      @question = Question.find(params[:id])
      render :show
    end
  end
end
