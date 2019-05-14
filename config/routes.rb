Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

match("/flexible/square/:zebra", { :controller => "calc", :action => "flex_square", :via => "get" })

match("/flexible/square_root/:kangaroo", { :controller => "calc", :action => "flex_square_root", :via => "get" })

match("/flexible/payment/:basis_points/:number_of_years/:present_value", { :controller => "calc", :action => "flex_payment", :via => "get" })

match("/flexible/random/:low_end/:high_end", { :controller => "calc", :action => "random", :via => "get" })

end
