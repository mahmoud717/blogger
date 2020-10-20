module ArticlesHelper
    
    def article_edit(article)
        if is_admin || is_user(article.user.id) == true
            link_to("Edit", edit_article_path(article.id), class: "btn btn-outline-info mr-1") +
            link_to("Delete", article_path(article.id), method: :delete , class: "btn btn-outline-danger", data:{confirm: "Really delete the article?"})
        end
    end
end
