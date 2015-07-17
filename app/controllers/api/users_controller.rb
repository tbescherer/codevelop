module Api
  class UsersController < ApiController

    def show
      @user = User.find(params[:id])
      render :show
    end

    def index
      @users = User.eager_load(user_answers: [answer_choice: :question])
      render :index
    end
  end
end
