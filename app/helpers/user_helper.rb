module UserHelper
  def count_loans
    User.user_all_loans_count(current_user)
  end

  def count_external_loans
    Loan.external_loans_count(current_user)
  end

  def count_groups
    Group.count
  end
end
