class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :set_current_user
  before_action :set_locale

  protect_from_forgery with: :exception
  before_action :set_cart

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
    def record_not_found
      render plain: "404 Not Found", status: 404
    end
    
    def set_current_user
      if session[:user_id].present?
        @current_user=User.find(session[:user_id])
      end
    end

    def require_login
      if !@current_user
        flash[:danger]='Требуется авторизация'
        redirect_to login_path
      end
    end

    def manager_permission
      unless @current_user.try(:moderator?)
        flash[:danger]="Недостаточно прав"
        redirect_to login_path
      end
    end

    def admin_permission
      unless @current_user.try(:admin?)
        flash[:danger]="Недостаточно прав"
        redirect_to login_path
      end
    end

    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

end
