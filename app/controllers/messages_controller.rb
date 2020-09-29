class MessagesController < ApplicationController

  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      render 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id:current_user.id)
  end
  
end
