module GroupsHelper
  def loan_author(loan)
    content_tag :b, "By: #{loan.creditor.name}", class: 'bold'
  end

  def all_groups(groups)
    groups.each do |group|
      concat(content_tag(:div, class: '') do
        concat(link_to((content_tag(:div, class: 'card m-2 p-3 w-auto') do
          concat(content_tag(:div, class: 'row justify-content-arround px-3') do
            concat(content_tag(:div, class: 'mr-2') do
              concat(content_tag(:i, 'group', class: 'material-icons fs-60 card-header-danger p-1 c-white'))
            end)
            concat(content_tag(:div, class: 'd-flex flex-column col justify-content-around') do
              concat(content_tag(:div, class: 'row mx-1 justify-content-between') do
                concat(content_tag(:p, group.name, class: 'font-weight-bold'))
              end)
              concat(content_tag(:hr, '', class: 'm-0'))
              concat(content_tag(:div, class: 'row mx-1 justify-content-between') do
                concat(content_tag(:label, group.created_at.strftime('%b %d, %Y').downcase, class: 'font-italic'))
                concat(content_tag(:label, "By: #{group.author.name}", class: 'font-italic'))
              end)
            end)
          end)
        end), group))
      end)
    end
  end
end
