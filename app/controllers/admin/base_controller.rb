class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_usuario!

end