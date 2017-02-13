require "#{Rails.root}/app/helpers/user_roles_helper.rb"
class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    include UserRolesHelper
end
