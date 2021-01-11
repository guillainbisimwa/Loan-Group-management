module UserHelper
    def count_loans(id)
        #loans = Loan.count(:all, :conditions => "user_id = " + id.to_s)
        loans = Loan.where({ author_id: current_user.id }).count()
    end

    def count_external_loans()
        n = []
        Grouploan.all.each do |s|
            n << s.loan_id
        end
        cmpt = Loan.ids.reject { |x| n.include?(x) }
        cmpt.count
    end

    def count_groups()
       groups = Group.count
    end
end
