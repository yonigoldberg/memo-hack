MemoHack::Application.routes.draw do
  root :to => "home#index"

  get 'memory' => 'memory#memory'
  post 'memory' => 'memory#save_memory_draft'
  match 'review' => 'review#current'
  match 'review/:id' => 'review#review'
  match 'about' => 'about#about'
  match '/auth/:provider/callback' => 'authentications#create'
  match 'logout' => 'authentications#destroy'
  match 'share' => 'share#show'
  match '/user_blog/save' => 'user_blog#save'
  match '/user_blog' =>'user_blog#select_blog'


  match "question_form" => "memory#question_form"
  post "/addquestion" => "memory#add_question"
end
