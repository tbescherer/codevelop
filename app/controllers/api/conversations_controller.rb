module Api
  class ConversationsController < ApplicationController
    def show
      @conversation = Conversation.find(params[:id])
      render :show
    end

    def index
      @conversations = current_user.conversations
      render :index
    end
  end
end
