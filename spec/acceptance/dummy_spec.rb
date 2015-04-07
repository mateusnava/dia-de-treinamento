require 'rails_helper'

RSpec.describe 'Homepage', type: :request do
  xit do
    visit root_path
    page.should have_content('Copyright &copy; 2012 App')
  end
end
