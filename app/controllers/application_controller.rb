class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sing_in_path_for(resource)
    current_user_path
  end

  def after_sing_out_path_for(resource_or_scope)
    request.referrer
  end

  before_filter :set_locale

  private

   def set_locale
     I18n.locale = params[:locale] if params[:locale].present?
   end

   def default_url_options(options = {})
     {locale: I18n.locale}
   end

end
