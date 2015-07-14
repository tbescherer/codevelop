module Api
  class ApiController < ApplicationController
    before_action :require_signed_in!

    def current_user
      render json: current_user
    end
  end
end
