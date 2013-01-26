MemoHack::Application.routes.draw do
  root :to => "home#index"

  match 'memory' => 'memory#memory'
  match 'review' => 'review#review'
  match 'about' => 'about#about'
  match '/auth/:provider/callback' => 'authentications#create'

  match "question_form" => "memory#question_form" 
  post "/addquestion" => "memory#add_question"

end
