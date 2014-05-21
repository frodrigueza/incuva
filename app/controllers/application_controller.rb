class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def export_members
    File.new("data.csv", "w+") do |f|
      Member.all.each do |m|
        f << [m.name, m.lastname, m.email].join(", ") + "\n"
      end
    end
  end

  protected

   # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    members_sign_in_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :lastname
  end


end
