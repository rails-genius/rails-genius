# Rails Genius Services

## 1) Use cases

- extract logic from controller:
```ruby
# inside controllers/posts_controller.rb
def create
  @post = Post::CreatePost.call!(**post_params)  
end

private
def post_params
  params.require(:post).permit(:title)
end

# inside services/post/create_post.rb
class Post
  class CreatePost < ApplicationService
    attr_accessor :title
    validates :title, presence: true
    
    def call
      Post.create!(title: title)
    end
  end
end
```
## 2) How to generate
```bash
rails g service my_module/service_name

# will create two files
# create  app/services/my_module/service_name.rb
# create  test/services/my_module/service_name_test.rb

```
## 3) Advanced Example

```ruby
# frozen_string_literal: true

# A sample service, you can delete this file safely
#
# @!attribute first_name
#   @return [String, nil]
# @!attribute last_name
#   @return [String, nil]
class SampleService < ApplicationService
  attr_accessor :first_name, :last_name
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }

  class SampleServiceError < ServiceError; end
  
  # run the service in background, on the critical queue
  jobify queue: :critical

  # instantiates a new User
  # @return [User]
  def call
    if trigger_error
      raise 'error has been triggered'
    end
    User.new(name: "#{first_name} #{last_name}")
  end

  # @return [Class<SampleService::SampleServiceError>]
  def class_error
    SampleServiceError
  end

  # @return [FalseClass]
  def trigger_error
    false
  end
end

```