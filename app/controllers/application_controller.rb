class ApplicationController < ActionController::Base
	
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		flash[:notice] = 'Signed in successfully.'
		user_path(current_user.id)
		
		#flash[:notice] = 'Welcome! You have signed up successfully.'
	end
	def after_sign_out_path_for(resource)
		root_path
	end
	
	protected
	def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end



# class AddNameToUsers < ActiveRecord::Migration[5.1]
#   def change
    # add_column :users, :username, :string
    # add_index :users, :username, unique: true
#   end
# end


# class RemoveAuthorFromUsers < ActiveRecord::Migration[5.1]
#   def change
    # remove_column :users, :username, :string
#   end
# end
