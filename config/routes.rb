Pressboxwisdom::Application.routes.draw do
  get "main/index"

  root :to => "main#index"  

  match "post/:post" => "main#post"
  match "tagid/:tagid" => "main#tagid", :as => "tag"
  match "tag/:tag" => "main#tags"
  match "user/:user" => "main#userposts"
  match "main/update_nickname" => "main#update_nickname"
  match "main/new_post" => "main#new_post"
	match "main/new_comment" => "main#new_comment", :as => "post"

end
