SCSonRails4::Application.routes.draw do

  devise_for :users
  
  root :to=>"posts#index"
    
  resources :schedules

  resources :lecturers
    
  resources :posts do
      resources :attachments
  end

  resources :subjects do
      get 'list', on: :collection
      resources :manuals
  end

  resources :materials do
    get 'aboutProfession', :on => :collection
    get 'lecturers', :on => :collection
    get 'contacts', :on => :collection
    get 'students', :on => :collection
    get 'distanceLearning', :on => :collection
    get 'methods', :on => :collection
    get 'scheduleL', :on => :collection
    get 'aboutdepartment', :on => :collection
    get 'scientific', :on => :collection
    get 'olympics', :on => :collection
    get 'matriculant', :on => :collection
    get 'subjects', :on => :collection
    get 'dormitories', :on => :collection
    get 'map', :on => :collection
    get 'documents', :on => :collection
    get 'groups', :on => :collection
    get 'gallery', :on => :collection
    get 'rest', :on => :collection
    get 'links', :on => :collection
  end
  
end
