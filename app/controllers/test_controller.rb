class TestController < ApplicationController
  def get
    user = User.first
    json_response(user)
  end
end
