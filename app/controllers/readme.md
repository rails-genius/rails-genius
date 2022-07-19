# Rails Genius API controllers

Refer for [JSON api controllers here](api/readme.md)

First define the controller as
```ruby
# in app/controllers/posts_controller

class PostsController < ApplicationController
  def index
    @posts = Post.all
    
    render Posts::IndexPage
  end
end
```

then define the view page with matestack

Refer to the [matestack page documentation here](https://docs.matestack.io/matestack-ui-core/v/2.1.0/ui-in-pure-ruby/pages/page-api-1)

Refer [here for reactive collections](https://docs.matestack.io/matestack-ui-core/v/2.1.0/built-in-reactivity/reactive-collections/overview)

```ruby
# in app/matestack/pages/posts/index_page.rb

module Posts
  class IndexPage < ApplicationPage
    include Matestack::Ui::VueJs::Components::Collection::Helper
    
    def response
      div id: "posts" do
        posts_list
        posts_list_as_components # optionally as components
      end
    end
    
    private
    
    def posts_list
      @posts.each do |post|
        div do
          # documents for styling: https://tailwindcss.com/
          paragraph post, class: 'text-red-500'
        end
      end
    end
    
    def posts_list_as_components
      @posts.each do |post|
        Posts::Post.call(post: post)
      end
    end
  end
end
```

optional posts as components

```ruby
# in app/matestack/components/posts/post.rb
module Posts
  class Post < ApplicationComponent
    required :post
    
    def response
      div do
        paragraph post, class: 'text-red-500'
      end
    end
  end
end
```