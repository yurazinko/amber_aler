class MessagesController < ApplicationController

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def new
    @message = Message.new
  end

  def create
    @emergency = Emergency.find(params[:id])
    @message = @emergency.messages.create(messages_params)
    @message.user = current_user

    if @message.save 
      redirect_to emergency_path(@emergency)
    else
      render :new
    end
  end

  def edit
    @emergency = Emergency.find(params[:id])
    @message = @emergency.messages.edit(messages_params)
  end

  def update
    @emergency = Emergency.find(params[:id])
    if @message = @emergency.messages.update(messages_params)
      redirect_to emergency_path(@emergency)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @emergency = Emergency.find(params[:id])
    @message.user = current_user
    if @message = @emergency.messages.destro(messages_params) 
      redirect_to emergency_path(@emergency)
    else
      redirect_to messages_path, flash: {error: 'Something goes wrong'}
    end
  end

  private

    def messages_params
      params.require(:message).permit(:user_name, :text, :claim_closed)
    end
end
