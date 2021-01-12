module UserHelper
  def count_loans(_id)
    Loan.where({ author_id: current_user.id }).count
  end

  def count_external_loans()
    n = []
    Grouploan.all.each do |s|
      n << s.loan_id
    end

    cmpt = Loan.where({ author_id: current_user.id }).ids.reject { |x| n.include?(x) }
    cmpt.count
  end

  def count_groups()
    Group.count
  end
end
