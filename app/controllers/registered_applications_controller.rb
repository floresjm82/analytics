class RegisteredApplicationsController < ApplicationController

  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index

    @registered_applications = RegisteredApplication.all

  end

  def show

    @events = @registered_application.events.group_by(&:name)
    Rails.logger.info ">>>> events: #{@events.inspect}"

  end

  def new
  
    @registered_application = RegisteredApplication.new

  end

  def create

    @registered_application = current_user.registered_applications.new(regapp_params)

    if @registered_application.save
      flash[:notice] = "Application registered!"
    else
      flash[:notice] = "Application was NOT registered"
    end

    redirect_to registered_applications_path

  end

  def edit

  end

  def update

    @registered_application.assign_attributes(regapp_params)

    if @registered_application.save
      flash[:notice] = "Application registered!"
      redirect_to @registered_application
    else
      flash[:error] = "Application was NOT registered"
      render :edit
    end

  end

  def destroy

    if @registered_application.destroy
      flash[:notice] = "\'#{@registered_application.name}\' was deleted successfully."
      redirect_to registered_applications_path
    else
      flash[:error] = "The application was not deleted."
      render :show
    end

  end



  private

  def set_registered_application
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def regapp_params
    params.require(:registered_application).permit(:name, :url)
  end



end
