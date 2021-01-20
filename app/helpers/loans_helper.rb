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

  def ext_loans
    Loan.ex_loans(current_user)
  end

  def ext_loans_sum
    Loan.external_loans_sum(current_user)
  end

  def all_loans(loans)
    
    loans.each do |loan|
      concat(content_tag(:div, class: 'card m-2 p-3 w-auto') do
        concat(content_tag(:div, class: 'row justify-content-arround px-3') do
          concat(content_tag(:div, class: 'mr-2') do
            concat(icon_loan(loan))
          end)
          concat(content_tag(:div, class: 'd-flex flex-column col justify-content-around') do
            concat(content_tag(:div, class: 'row mx-1 justify-content-between') do
              concat(content_tag(:p, loan.name, class: 'font-weight-bold'))
              concat(content_tag(:b, '$ ' + (loan.amount).to_s))
            end)
            concat(content_tag(:hr, '', class: 'm-0'))
            concat(content_tag(:div, class: 'row mx-1 justify-content-between') do
              concat(content_tag(:label, loan.created_at.strftime('%b %d, %Y').downcase, class: 'font-italic'))
              concat(content_tag(:label, group_name(loan), class: 'font-italic'))
            end)
          end)
        end)
      end)
    end
  end
end
