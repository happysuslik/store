class UsersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource

end
