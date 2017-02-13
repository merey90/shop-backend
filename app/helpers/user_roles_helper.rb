module UserRolesHelper
    def is_admin(current_user)
        unless current_user.role == 'admin'
            render json: {
              errors: ["Insufficient permissions."]
            }, status: 403
        end
    end

    def is_regular(current_user)
        unless current_user.role == 'regular'
            render json: {
              errors: ["Insufficient permissions."]
            }, status: 403
        end
    end

    def is_owner(current_user)
        unless current_user.role == 'owner'
            render json: {
              errors: ["Insufficient permissions."]
            }, status: 403
        end
    end
end
