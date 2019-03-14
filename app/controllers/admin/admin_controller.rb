class Admin::AdminController < ApplicationController
  include CheckAdminHelper
  before_action :authenticate_user!
  before_action :check_if_admin
  
  def index
  end
end
