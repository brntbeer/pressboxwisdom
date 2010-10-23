Pressboxwisdom::Application.routes.draw do
  get "main/index"

  root :to => "main#index"  

  match "post/:post" => "main#post"
  match "tag/:tag" => "main#tags"
  match "main/update_nickname" => "main#update_nickname"

end
