class RegistrationsController < Devise::RegistrationsController

  private

    def sign_up_params
      allow = [:name, :lastname, :email, :interest_area, :school_dependence, :zone, :phone, :your_fields, :password, :password_confirmation]
      params.require(resource_name).permit(allow)
    end

end