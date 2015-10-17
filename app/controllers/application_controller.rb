class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def after_sign_out_path_for(resource_or_scope)
    new_usuario_session_path
  end

  private

  def layout_by_resource
    if devise_controller?
      'admin'
    else
      'application'
    end
  end
end
