module Api
  class UsersController < ApiController

    def show
      @user = User.find(params[:id])
      render :show
    end

    def index
      @users = User.includes(user_answers: [answer_choice: :question]).all
      render :index
    end
  end
end
