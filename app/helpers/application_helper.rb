module ApplicationHelper
  def check_session()
    if logged_in?
      link_to('Log out', logout_path, class: 'my-2 my-sm-0 logout links mr-2', method: :delete)
    else
      link_to('Log in', login_path, class: 'my-2 my-sm-0 login links mr-2')
    end
  end
end
