module ApplicationHelper
  def auth_link
    if @user&.active_at && @user[:active_at] >= Time.new.to_i - 900
      link_to "Log out", logout_path, class: "sn-Header-link"
    else
      link_to "Log in", "/", class: "sn-Header-link"
    end
  end
end
