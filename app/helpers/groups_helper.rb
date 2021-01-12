module GroupsHelper
  def loan_author(loan)
    content_tag :b, "By: #{loan.creditor.name}", class: 'bold'
  end
end
