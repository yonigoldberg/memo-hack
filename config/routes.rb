MemoHack::Application.routes.draw do
  root :to => "home#index"

  get 'memory/:qid' => 'memory#memory'
  get 'memory' => 'memory#random_memory'
  post 'memory' => 'memory#save_memory_draft'
  match 'memory/:qid/delete' => 'memory#destroy'
  match 'memory/:qid/toggle_publish' => 'memory#toggle_publish'

  match 'review' => 'review#current'
  match 'review/:id' => 'review#review'
  match 'review/timeline/:id' => 'review#timeline'
  match 'about' => 'about#about'
  match '/auth/:provider/callback' => 'authentications#create'
  match 'logout' => 'authentications#destroy'
  match 'share' => 'share#show'
  match '/user_blog/save' => 'user_blog#save'
  match '/user_blog' =>'user_blog#select_blog'


  match "question_form" => "memory#question_form"
  post "/addquestion" => "memory#add_question"
end
