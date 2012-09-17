module ApplicationHelper
    def parent_layout(layout)
        render :file => "layouts/#{layout}"
    end
end
