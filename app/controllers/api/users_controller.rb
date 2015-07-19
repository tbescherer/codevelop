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

    def update
      @user = User.find(params[:id])
      @user.update!(user_params)
      render :show
    end

    def edit
    end

    private

    def user_params
      params.require(:user).permit(:avatar, :about_field_one, :about_field_two, :about_field_three)
    end
  end
end
