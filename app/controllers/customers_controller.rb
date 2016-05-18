class CustomersController < ApplicationController
  PAGE_SIZE = 10

  def index
    @page = (params[:page] || 0).to_i
    if params[:keywords].present?
      @keywords = params[:keywords]
      customer_search_term = CustomerSearchTerm.new(@keywords)
      query = Customer
        .where(customer_search_term
        .where_clause, customer_search_term.where_args)
        .order(customer_search_term.order) || []
      @customers = 
        query.offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    else
      @customers = []
    end
    @number_of_pages = (query.count%PAGE_SIZE) == 0 ? (query.count/PAGE_SIZE) : (query.count/PAGE_SIZE + 1)
  end
end