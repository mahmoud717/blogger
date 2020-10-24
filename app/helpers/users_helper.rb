module UsersHelper
    def user_edit(user)
        if is_admin || is_user(user.id) == true
            link_to("Edit profile", edit_user_path(user.id), class: "btn btn-info mr-1") 
        end
    end
    def user_destroy(user)
        link_to("Delete", article_path(user.id), method: :delete , class: "btn btn-outline-danger", data:{confirm: "Do you really want to delete this account? \nAll articles related to this account will be deleted!!"})
    end
    def user_articles(user)
        if !user.articles.empty?
            "<h1 class='text-white text-center'>Articles </h1>".html_safe
        else
            "<p class='text-center text-white mt-5 mb-5'>There are no articles</p>".html_safe
        end
    end
    def user_new_articles(articles) 
        if articles.empty?
            link_to "Create a New Article", new_article_path, class: "new_article btn btn-success text-center" if is_logged_in? && is_user(@user.id) 
        end
    end
    def gravatar_for(user)
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        image_src = "https://www.gravatar.com/avatar/#{hash}?s=300"
        image_tag image_src , alt: user.name, class: "text-center rounded"
    end
end
