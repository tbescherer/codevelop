module Api
  class UsersController < ApiController

    def show
      @user = User.find(params[:id])
      render :show
    end

    def index
      @users = User.eager_load(user_answers: [answer_choice: :question])
      @users = @users.search_by_username(params[:query]) unless params[:query].blank?
      @users = @users.sort_by{|user| -user.match_score(current_user)}
      @users = Kaminari.paginate_array(@users).page(params[:page])
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
      params.require(:user).permit(:avatar, :about_field_one, :about_field_two, :about_field_three, :age, :job, :looking_for, :language)
    end
  end
end
