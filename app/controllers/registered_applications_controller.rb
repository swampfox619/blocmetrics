class RegisteredApplicationsController < ApplicationController
  
  def index
    @apps = current_user.registered_applications.all
  end

  def show
    @app = RegisteredApplication.find(params[:id])
  end

  def new
    @app = RegisteredApplication.new
    @user = current_user
  end

  def create
    @app =  RegisteredApplication.new(app_params)
    
    if @app.save
      flash[:notice] = "Application was saved."
      redirect_to registered_application_path(@app)
    else
      flash.now[:alert] = "There was an error saving your application.  Please try again."
      render :new
    end
    
  end

  def edit
    @app = RegisteredApplication.find(params[:id])
  end
  
  def update
    @app = RegisteredApplication.find(params[:id])
    if @app.update(app_params)
      redirect_to registered_application_path(@app), notice: "Application was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @app = RegisteredApplication.find(params[:id])
    @app.destroy
    redirect_to registered_applications_path
  end
  
  private
  
  def app_params
    params.require(:registered_application).permit(:name, :url, :user_id)
  end
  
end
