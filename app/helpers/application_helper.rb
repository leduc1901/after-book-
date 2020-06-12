module ApplicationHelper
    def full_title(page_title)
        "#{page_title}"
    end

    def current_order
        if !session[:order_id].nil?
            Order.find(session[:order_id])
        else
            Order.new
        end
    end

end
