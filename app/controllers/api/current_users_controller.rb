module Api
  class CurrentUsersController < ApplicationController
    def show
      render json: current_user
    end
  end
end
