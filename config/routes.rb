Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

match("/flexible/square/5", { :controller => "calc", :action => "flex_square", :via => "get"})

end
