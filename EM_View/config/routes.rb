Rails.application.routes.draw do
 
  post '/api/v1/create_account' => 'accounts#createAccount'
  get '/api/v1/get_accounts' => 'accounts#getAccounts'
  post '/api/v1/create_expense' => 'expenses#createExpense'
  get '/api/v1/get_expenses' => 'expenses#getExpenses'
  put '/api/v1/edit_expense' => 'expenses#editExpense'
  delete '/api/v1/delete_expense/:id' => 'expenses#deleteExpense'
  get '*path' => 'static#index'
  root 'static#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
