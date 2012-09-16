module ApplicationHelper
    def parent_layout(layout)
        self.output_buffer = render(:file => "layouts/#{layout}")
    end
end
