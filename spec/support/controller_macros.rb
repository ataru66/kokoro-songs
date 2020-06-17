module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in create(:admin) # Using factory bot as an example
    end
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in create(:user)
  end
end