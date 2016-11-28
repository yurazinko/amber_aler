class MessagesController < ApplicationController
  before_action :find_emergency_path, only: [:new, :create, :edit, :update, :show, :destroy]

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def new
    @message = Message.new
  end

  def create
    @message = @emergency.messages.create(messages_params)
    @message.user = current_user

    if @message.save 
      redirect_to emergency_path(@emergency)
    else
      render :new
    end
  end

  def edit
    @message = @emergency.messages.edit(messages_params)
  end

  def update
    if @message = @emergency.messages.update(messages_params)
      redirect_to emergency_path(@emergency)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @message = @emergency.messages.destro(messages_params) 
      redirect_to emergency_path(@emergency)
    else
      redirect_to messages_path, flash: {error: 'Something goes wrong'}
    end
  end

  private

    def find_emergency_path
      @emergency = Emergency.find(params[:id])
    end

    def messages_params
      params.require(:message).permit(:user_name, :text, :claim_closed)
    end
end
