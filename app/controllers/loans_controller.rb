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

    if @loan.save

      flash[:notice] = 'You have successfully created loan'
      byebug
      
      
      @grouploan = Grouploan.new(@loan.id

      redirect_to home_path
    else
      flash[:alert] = 'Error occurs while saving loan'
      redirect_to home_path
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:name, :amout)
  end
end
