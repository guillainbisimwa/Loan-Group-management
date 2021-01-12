module LoansHelper
    def icon_loan(loan)
        
        unless loan.grouploan.empty?
            content_tag :i, "group", class: 'material-icons fs-60 card-header-danger p-1 c-white' 
        else 
            content_tag :i, "person", class: 'material-icons fs-60 card-header-info p-1 c-white' 
        end
    end

    def group_name(loan)
        
        unless loan.grouploan.empty?
            l =  loan.grouploan
            content_tag :b, l , class: 'bold' 
        end
    end
end
