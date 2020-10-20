class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[updata destroy]
end
