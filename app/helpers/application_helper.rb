module ApplicationHelper

    def sanitize html
      raw Sanitize.clean(html, 
        :elements => ['p','span','a','table','thead','tbody','tr','td','img','object'], 
        :attributes => {
          :all         => ['id','class'],
          'a'          => ['href', 'title'],
          'blockquote' => ['cite'],
          'img'        => ['alt', 'src', 'title']
        },
        :remove_contents => true)
    end

end
