class User::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(:namefirst, :namelast, :email, :password, :password_confirmation, :current_password, :admin)
    end

    def sign_up
        default_params.permit(:namefirst, :namelast, :email, :password, :password_confirmation, :current_password, :admin)
    end

     def sign_in
        default_params.permit(:email, :password)
    end

end

