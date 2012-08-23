WorkflowBuilder::Application.routes.draw do

  # root redirect
  root :to => "workflows#index"

  # authentication
  match "/auth/:provider/callback", to: "sessions#create"

  resource  :sessions
  resources :workflows

end
