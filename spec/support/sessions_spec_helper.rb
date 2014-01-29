require 'spec_helper'

def login
  user = create(:user)
  login_as user, scope: :user
  user
end