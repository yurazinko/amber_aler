class EmergenciesController < ApplicationController

  before_action :find_emergency, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :only_author!, only: [:edit, :update, :destroy]
 
  def index
    @emergencies = Emergency.all.order('created_at DESC')
  end

  def new
    @emergency = Emergency.new
  end

  def create
    @emergency = Emergency.new(page_params)
    @emergency.user = current_user
    if @emergency.save
      redirect_to emergencies_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @emergency.update(page_params)
      redirect_to emergencies_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @emergency.destroy
      redirect_to emergencies_path
    else
      redirect_to emergencies_path, flash: {error: 'Something goes wrong'}
    end
  end

  private
    def only_author!
      unless @emergency.user == current_user
        redirect_to emergencies_path, flash: {error: 'Only author can update emergency'}
      end
    end

    def page_params
      params[:emergency].permit(:title, :description)
    end

    def find_emergency
      @emergency = Emergency.find(params[:id])
    end

end
