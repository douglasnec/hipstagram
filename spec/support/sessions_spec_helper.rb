require 'spec_helper'

def login
  login_as create(:user), scope: :user
end