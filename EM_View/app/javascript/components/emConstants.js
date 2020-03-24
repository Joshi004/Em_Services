api = '/api'
ver = '/v1'
server='http://localhost:3001'
urls={
    create_account:server+api+ver+'/create_account',
    get_accounts:server+api+ver+'/get_accounts',
    get_expenses:server+api+ver+'/get_expenses',
    create_expense:server+api+ver+'/create_expense',
    delete_expense:server+api+ver+'/delete_expense/',
    edit_expense:server+api+ver+'/edit_expense',
    login:server+api+ver+'/login'
}

accountTableMap = [
    { field : 'name', label:'Name',toDisplay:true},
    { field : 'details', label:'Details',toDisplay:true},
    { field : 'initial_amount', label:'Initial Amount',toDisplay:true},
    { field : 'created_at', label:'Created On',toDisplay:true},
    { field : 'updated_at', label:'Last Update',toDisplay:true},
    { field : 'total_spent', label:'Total Expendeture',toDisplay:true},
]

expenseTableMap = [
    { field : 'amount', label:'Amount',toDisplay:true},
    { field : 'category', label:'Expense Category',toDisplay:true},
    { field : 'payement_method', label:'Payed Via',toDisplay:true},
    { field : 'description', label:'Paid For',toDisplay:true},
    { field : 'account_name', label:'For Account',toDisplay:false},
]
