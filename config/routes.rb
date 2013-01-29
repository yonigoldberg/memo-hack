MemoHack::Application.routes.draw do
  root :to => "home#index"

  match 'memory' => 'memory#memory'
  match 'review' => 'review#review'
  match 'about' => 'about#about'
  match '/auth/:provider/callback' => 'authentications#create'
  match 'logout' => 'authentications#destroy'
  match 'share' => 'share#share'
  match '/user_blog/save' => 'user_blog#save'
  match '/user_blog' =>'user_blog#select_blog'


  match "question_form" => "memory#question_form"
  post "/addquestion" => "memory#add_question"
end
