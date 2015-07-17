module Api
  class ConversationRepliesController < ApplicationController
    def new
    end

    def create
      @conversation_reply = current_user.conversation_replies.new(conv_reply_params)

      if @conversation_reply.save
        render json: ["hello"]
      else
        render json: ["goodbye"]
      end
    end

    private
    def conv_reply_params
      params.require(:conversation_reply).permit(:user_id, :conv_id, :body)
    end
  end
end
