Rails.application.routes.draw do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    mount_devise_token_auth_for 'Admin', at: 'admin_auth', skip: [:omniauth_callbacks]

    # this route will authorize requests using the User class
    #   get 'demo/members_only', to: 'demo#members_only'

    # routes within this block will authorize requests using the Admin class
    #   devise_scope :admin do
    #     get 'demo/admins_only', to: 'demo#admins_only'
    #   end

    resources :products do
        collection do
            get :carousels
        end

        resources :product_varieties do
            resources :product_images
        end
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
