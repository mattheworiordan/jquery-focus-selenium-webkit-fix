JqueryFocusSeleniumFix::Application.routes.draw do
  get 'without-jquery-test-fix' => 'test#without-fix', :as => :without_fix
  root :to => 'test#index'
end
