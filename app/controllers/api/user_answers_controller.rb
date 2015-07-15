module Api
  class UserAnswersController < ApiController
    def create
      @user_answer = current_user.user_answers.new(user_answer_params)

      if @user_answer.save
        render json: ["hello"]
      else
        render json: ["goodbye"]
      end
    end

    private
    def user_answer_params
      params.require(:user_answer).permit(:answer_choice_id, :weight, :explanation)
    end
  end
end
