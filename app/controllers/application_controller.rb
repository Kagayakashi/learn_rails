class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		# sign up parameters.
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
	end

	def after_sign_in_path_for(resource)
		if resource.is_a?(Admin)
			admin_root_path
		else
			super
		end
	end
end
