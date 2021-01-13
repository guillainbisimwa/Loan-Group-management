module LoansHelper
  def icon_loan(loan)
    if loan.groups.empty?
      content_tag :i, 'person', class: 'material-icons fs-60 card-header-info p-1 c-white'
    else
      content_tag :i, 'group', class: 'material-icons fs-60 card-header-danger p-1 c-white'
    end
  end

  def group_name(loan)
    content_tag :b, "Group: #{loan.groups.first.name}", class: 'bold' unless loan.groups.empty?
  end
end
