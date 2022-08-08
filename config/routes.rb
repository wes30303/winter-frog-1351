Rails.application.routes.draw do
   resources :plots, only:[:index]
   resources :gardens, only:[:show]

   delete "/plantplots/:plot_id/:plant_id", to: 'plant_plots#destroy'

end
