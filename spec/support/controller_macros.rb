module ControllerMacros
  def self.extended(base)
    base.set_host
  end
  
  def set_host
    before(:each) do
      request.host = 'http://localhost:3000'
    end
  end
  
  def login_user
    before(:each) do
      user = FactoryGirl.create(:user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @current_user = user
      
      sign_in user
    end
  end
end
