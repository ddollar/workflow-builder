WorkflowBuilder::Application.routes.draw do

  # root redirect
  root :to => "workflows#index"

  # authentication
  match "/auth/:provider/callback", to: "sessions#create"

  resource  :sessions
  resources :workflows do
    resources :runs, :only => :show
  end

end
