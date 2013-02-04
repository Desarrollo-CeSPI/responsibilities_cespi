class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_filter :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, :with => :not_allowed


  private

    #pundit cuando tira la exception
    def not_allowed
      redirect_to root_path, :alert => "No tiene permisos para realizar esta accion"
    end
end
