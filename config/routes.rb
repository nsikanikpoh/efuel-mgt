Rails.application.routes.draw do

   class String
    def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
    chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
    Array.new(len){ chars.sample }.join
  end
 end 

  devise_for :admins, :path => '3dpetman-authentication-engine-H1A0GYA7S2N-2AAGGAA7'
  resources :admins
  resources :managers, :path => 'company-manager-3dpetman-membership-XGHJBG-EGJ5IM1SB'
  resources :companyadmins, :path => 'company-admin-3dpetman-membership-XWOXCG-8GJ5PERAS'
  
  resources :zones, :path => 'company-zone-3dpetman-membership-XWOWBG-8GJ5PT1RB'
  get 'zonalmanagers/index'

  get 'zonalmanagers/new'

  get 'zonalmanagers/edit'

  get 'zonalmanagers/create'

  get 'zonalmanagers/update'

  get 'zonalmanagers/destroy'

  get 'managers/index'

  get 'managers/new'

  get 'managers/edit'

  get 'managers/create'

  get 'managers/update'

  get 'managers/destroy'

  get 'manager/index'

  get 'manager/new'

  get 'manager/edit'

  get 'manager/create'

  get 'manager/update'

  get 'manager/destroy'


	root 'dashboard#dashboard'
	get 'b' =>  'dashboard_angular#index'
	get 'ben' => 'dashboard_angular#name'
get 'dashboard' => 'dashboard#dashboard'
get '3dpetman-company-zones' => 'dashboard#companyzones'
get '3dpetman-company-stations' => 'dashboard#companystations'
get '3dpetman-company-zonal-managers' => 'dashboard#companyzonalmanagers'
get '3dpetman-company-managers' => 'dashboard#companymanagers'
get '3dpetman-company-sales-reports' => 'dashboard#companyreports'
#get 'companyreports' => 'charts#companyreports'
	get '/' => 'dashboard#dashboard'
  get 'dashboard/dashboard'

  resources :pumps, :path => 'company-3dpetman-models-UYTFFGF-GHFHFGFGGFV'
  resources :sales_reports, :path => 'company-3dpetman-models-EDFDDFC-ODSSSRRDF'
  resources :stocks, :path => 'company-3dpetman-models-XWOWBG-NDSSRJKHHU'
  resources :stock_tanks, :path => 'company-3dpetman-models-XWOWBG-PIGGFFDG'
  resources :tanks, :path => 'company-3dpetman-models-XWOWBG-OIHNBFDHJK'
  resources :products, :path => 'company-3dpetman-models-EDGFJB-SWAFCCBMJH'
  resources :managers, :path => 'company-3dpetman-models-XWOWBG-8GJ5PT1RB'
  
  resources :stations, :path => 'company-3dpetman-station-BHOWBG-1LJ5PT1JO'
  resources :companies, :path => 'company-3dpetman-membership-XWOWBG-8GJ5PT1RB'


resources :stations do
  member do
      get 'newproduct'
     
      
      get 'newmanager'
    
  end
end


resources :zones do
  member do
      get 'newstation'
      get 'newzonalmanager'
    
  end
end

resources :products do
      member do
     
       get 'newreport'
      get 'newpump'
    end
end

resources :pumps do
      member do
      get 'newstock'
       get 'newtank'
     
    end
end

resources :stations do
  resources :sales_reports 
 end

resources :pumps do
  resources :tanks 
 end

 resources :pumps do
  resources :stocks 
 end


 resources :stations do
  resources :managers 
 end

 resources :zones do
  resources :stations 
 end

  resources :zones do
  resources :zonalmanagers
 end

resources :companies do
    resources :stations
end

 resources :stations do
  resources :products 
 end

resources :products do
  resources :sales_reports
 end

resources :zonalmanagers do
  resources :stations
 end

  resources :products do
      resources :pumps
    end 

resources :stocks do 
  
  resources :stock_tanks

end 


 resources :products do
      resources :stocks
    end 
  # For details on the DSL availab  member dole within this file, see http://guides.rubyonrails.org/routing.html
end
