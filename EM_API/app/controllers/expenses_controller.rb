class ExpensesController < ApplicationController
	# skip_before_action :verify_authenticity_token
	# rescue_from StandardError, :with => :render_standard_error

	def render_standard_error(error)
		puts "REcording Error *****"
		ise = InternalServerError.new(error.message)
		ise.set_backtrace(error.backtrace)
		puts "REcording Error ***** #{error.message} ******************"
		puts error.message
		render json: {err:error.message}
	  end


    def getExpenses()
        if(params['account_id'] == 'all')
		temp = Expense.find_by_sql('select e.*,a.name as account_name from expenses e left join accounts a on a.id=e.account_id;')
		render json: temp.to_json

        else
		temp =  Expense.find_by_sql("select e.*,a.name as account_name from expenses e left join accounts a on a.id=e.account_id where a.id= #{params['account_id']};")
		render json: temp.to_json

        end
    end
    
    def expense_params
		# params.require(:expense).permit(:id, :amount, :category,:account_id, :description,:payement_method,:created_at,:updated_at)
		return {'id' => params['id'], 'amount' => params['amount'], 'category' => params['category'], 'description' => params['description'], 'payement_method' => params['payement_method'], 'account_id' => params['account_id']}
	end


    def createExpense()
		@expense = Expense.new(expense_params)
		result = @expense.save!
		puts "result is  : #{result}"
		render json: result
	end

	def deleteExpense
		expense = Expense.find(params['id'])
		expense.delete
		result  = expense.save!
		render json: result
	end

	def editExpense
		@expense = (expense_params)
		render json: Expense.update(params['id'],@expense) 
		puts "adding this #{params}"
	end

end
