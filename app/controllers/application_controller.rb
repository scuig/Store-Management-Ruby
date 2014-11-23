class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception


def index

	if session[:signed_in] == false
		redirect_to '/login'
	end
end


def login
	@username = params[:username]
	@password = params[:password]
	if @username && @password
		session[:signed_in] = true
		session[:username] = params[:username]
		redirect_to '/index'
	end

end

def logout

	session[:signed_in] = false
	redirect_to '/login'

end

end
