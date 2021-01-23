module ApplicationHelper
  def check_session()
    if logged_in?
      link_to('Log out', logout_path, class: 'my-2 my-sm-0 logout links mr-2', method: :delete)
    else
      link_to('Log in', login_path, class: 'my-2 my-sm-0 login links mr-2')
    end
  end

  def notification
    if flash[:notice]
      concat(content_tag(:div, class: 'alert alert-success') do
        concat(content_tag(:div, class: 'container') do
          concat(content_tag(:div, class: 'alert-icon') do
            content_tag(:i, 'check', class: 'material-icons')
          end)
          concat(content_tag(:button, class: 'close', type: 'button', 'data-dismiss': 'alert', 'aria-label': 'Close') do
            content_tag(:span, content_tag(:i, 'clear', class: 'material-icons'), 'aria-hidden': 'true')
          end)
          concat(content_tag(:b, flash[:notice], class: 'msg'))
        end)
      end)

    elsif flash[:alert]
      concat(content_tag(:div, class: 'alert alert-danger') do
        concat(content_tag(:div, class: 'container') do
          concat(content_tag(:div, class: 'alert-icon') do
            content_tag(:i, 'check', class: 'material-icons')
          end)
          concat(content_tag(:button, class: 'close', type: 'button', 'data-dismiss': 'alert', 'aria-label': 'Close') do
            content_tag(:span, content_tag(:i, 'clear', class: 'material-icons'), 'aria-hidden': 'true')
          end)
          concat(content_tag(:b, flash[:alert], class: 'msg'))
        end)
      end)

    end
  end
end
