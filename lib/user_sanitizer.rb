class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(:namefirst, :namelast, :email, :password, :password_confirmation, :current_password, :admin)
    end
end

