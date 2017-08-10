require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  module SignInHelper
    def sign_in_as(user)
      post session_url(email: user.email, password: user.password)
    end
  end

  class ActionDispatch::IntegrationTest
    include SignInHelper
  end

end
