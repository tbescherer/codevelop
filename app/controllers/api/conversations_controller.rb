module Api
  class ConversationsController < ApplicationController
    def show
      @conversation = current_user.conversations.includes(:user_one, :user_two, replies: :user).find(params[:id])
      render :show
    end

    def index
      @conversations = current_user.conversations.includes(:user_one, :user_two, replies: :user)
      render :index
    end

    def create
      @conversation = Conversation.new(conv_params)

      if @conversation.save
        render :show
      else
        render json: []
      end
    end

    private
    def conv_params
      params.require(:conversation).permit(:user_one_id, :user_two_id)
    end
  end
end
