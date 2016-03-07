Rails.application.routes.draw do
  #resources :tasks COMENTAMOS esta otra que nos ha creado con generate resource task
  #resources :users TENEMOS QUE BORRAR ESTE QUE NOS HA CREADO AL HACER rails g resource

  # URL xxxx/api/v1/xxxx
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit] do
        resources :tasks, except: [:new, :edit]
        post 'task/:id/complete', to: 'tasks#complete' #Al estar anidado tiene implícitos los parámetros de arriba
      end
    end
  end

end
