Benconstable::Application.routes.draw do
  root :to => 'static#home'
  match 'portfolio' => 'static#portfolio'
  match 'cv' => 'static#cv'

  match "500", :to => "errors#error_500"
  match "404", :to => "errors#error_404"
end
