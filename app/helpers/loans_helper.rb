module LoansHelper
    def icon_loan(loan)
        unless loan.groups.empty?
            content_tag :i, "group", class: 'material-icons fs-60 card-header-danger p-1 c-white' 
        else 
            content_tag :i, "person", class: 'material-icons fs-60 card-header-info p-1 c-white' 
        end
    end

    def group_name(loan)
        
        unless loan.groups.empty?
            name =  loan.groups.first.name
            content_tag :b, 'Group: ' + name , class: 'bold' 
        end
    end
end
