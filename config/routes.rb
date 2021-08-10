Rails.application.routes.draw do
  namespace :api, format: :json do
    namespace :netkeiba do
      namespace :orepro do
        namespace :v1 do
          resources :predictions, only: [:create]
        end
      end
    end
  end
end
