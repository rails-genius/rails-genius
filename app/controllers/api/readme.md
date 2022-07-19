# Rails Genius API controllers

### To add a new controller

first add the controller file
```ruby
# in app/controllers/api/v1/posts_controller.rb

module Api
  module V1
    class PostsController < BaseController
      def index
        @posts = Post.all
      end
    end
  end
end
```

then define a `.jb` file to render the json

refer to the [jb documentation here](https://github.com/amatsuda/jb)

```ruby
# in app/view/api/v1/posts/index.jb

{
  posts: render partial: 'api/v1/posts/post', collection: @posts, as: :post
}

# in app/view/api/v1/posts/_post.jb
# define the serializer as:

{
  id: post.id,
  title: post.title,
  custom_attribute: post.custom_attribute
}

# or

post.as_json(only: %i[id title]).tap do |j|
  j[:custom_attribute] = post.custom_attribute
end
```

then add it to routes.rb
```ruby

  namespace :api, format: :json do
    namespace :v1 do
      #... other endpoints
      
      resources :posts, only: %i[index] # allow only the index action
    end
  end
```

### Test the controller

define the test as:

```ruby
# in test/controllers/api/v1/posts_controller_test.rb
# frozen_string_literal: true

module Api
  module V1
    class BaseControllerTest < ActionDispatch::IntegrationTest
      describe 'GET /api/v1/posts' do
        let(:posts) { create_list(:post, 2, title: 'title') }
        
        before do
          posts
          sign_in
        end
        
        it 'success' do
          get '/api/v1/posts'

          assert_response :success
          json[:posts].tap do |j_posts|
            assert_equal 2, j_posts.size

            j_posts.first.tap do |post|
              assert_equal 'title', post[:title]
            end
          end
        end
      end
    end
  end
end
```