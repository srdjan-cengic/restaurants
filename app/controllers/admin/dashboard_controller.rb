# namespace :admin do
    #get '', to: 'dashboard#index', as: '/'
  #end

# rails generate controller admin/dashboard index


class Admin::DashboardController < Admin::BaseController
  def index
  	@users_count = User.count
  	@number_of_confirmed_users = User.where(confirmed: true).count
  end

  def profile
  end
end
