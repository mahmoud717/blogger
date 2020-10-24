module ApplicationHelper
    def is_logged_in?
        session.key?("current_user") ? true : false 
    end
    def is_admin
        if is_logged_in?
        session["current_user"]["is_admin"] == "true" ? true : false  
        end
    end
    def is_user(user_id)
        if is_logged_in?
        session["current_user"]["id"] == user_id ? true : false
        end
    end
    def dropdown
        if is_logged_in?
            link_to "signout", logout_path, class: "dropdown-item"
        else
            link_to("signup", signup_path, class: "dropdown-item") + 
            link_to("login", login_path, class: "dropdown-item")
        end
    end
end
