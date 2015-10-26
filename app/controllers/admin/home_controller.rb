class Admin::HomeController < Admin::BaseController
  def index
    @logins = Login.ultimos
  end
end
