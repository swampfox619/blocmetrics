class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to registered_applications_path
    end
  end
end
