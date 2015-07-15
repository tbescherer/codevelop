module Api
  class CurrentUsersController < ApplicationController
    def show
      @user = current_user
      render "api/users/show"
    end
  end
end
