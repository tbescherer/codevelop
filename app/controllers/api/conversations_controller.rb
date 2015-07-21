module Api
  class ConversationsController < ApplicationController
    def show
      @conversation = Conversation.find(params[:id])
      render :show
    end

    def index
      @conversations = current_user.conversations.includes(:replies)
      render :index
    end

    def create
      @conversation = Conversation.new(conv_params)

      if @conversation.save
        render json: @conversation
      else
        render json: @conversation
      end
    end

    private
    def conv_params
      params.require(:conversation).permit(:user_one_id, :user_two_id)
    end
  end
end
