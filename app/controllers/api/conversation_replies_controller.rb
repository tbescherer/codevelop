module Api
  class ConversationRepliesController < ApplicationController
    def new
    end

    def create
      @conversation_reply = current_user.conversation_replies.new(conv_reply_params)
      if @conversation_reply.save
        push_message(@conversation_reply)
        render json: []
      else
        render json: []
      end
    end

    def show
      render json: @conversation_reply
    end

    private
    def conv_reply_params
      params.require(:conversation_reply).permit(:user_id, :conv_id, :body)
    end
  end
end
