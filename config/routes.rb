MinecraftManager::Application.routes.draw do
  root :to => 'visitors#new'

  resources :instances
end
