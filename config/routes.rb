Pressboxwisdom::Application.routes.draw do
  get "main/index"

  root :to => "main#index"  

  match "post/:post" => "main#post"
  match "tagid/:tagid" => "main#tagid", :as => "tag"
  match "tag/:tag" => "main#tags"
  match "user/:user" => "main#userposts"
  match "main/update_nickname" => "main#update_nickname"

end
