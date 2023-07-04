class ApplicationController < ActionController::Base
end

  def after_sign_out_path_for(resource)
    root_path
  end