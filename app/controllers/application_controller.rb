class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :exception

  # nat - change to this to fix the issue of "Can't verify CSRF token authenticity"
  protect_from_forgery with: :null_session

  # Nat added - http://stackoverflow.com/questions/30204321/rails-cant-verify-csrf-token-authenticity
  # API POST REGUEST ALLOW CROSS DOMAIN
    before_filter :cor
    def cor
      headers["Access-Control-Allow-Origin"]  = "*"
      headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
      headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
      head(:ok) if request.request_method == "OPTIONS"
    end
end
