class LoansController < ApplicationController
  before_action :require_user

  def new
    @group = Group.all
  end

  def index; end

  def create
    @loan = Loan.new(loan_params)
    @loan.author_id = current_user.id
    @groups_ids = params[:loan][:groups_ids]

    # if @groups_ids.empty?
    #   flash[:alert] = 'You must choose a group'
    #   redirect_to new_loan_path
    #   return
    # end

    if @loan.save

      flash[:notice] = 'You have successfully created loan'
      
      @grouploan = Grouploan.new(loan_id:@loan.id, group_id: @groups_ids)
      @grouploan.save unless @groups_ids.empty?

      redirect_to home_path
    else
      flash[:alert] = 'Error occurs while saving loan'
      redirect_to new_loan_path
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:name, :amount)
  end
end
