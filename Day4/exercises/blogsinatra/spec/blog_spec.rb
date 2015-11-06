
require_relative '../server.rb'

RSpec.describe "Blog" do 

  before :each do
    @blog = Blog.new
    @post = Post.new("Post1","Hi, this is my first post")
    @post2 = Post.new("Post2","Hi, this is my second post")
    @post3 = Post.new("Post3","Hi, this is my third post")
    
  end
  describe "#add_post" do

  	it "Add a post to the posts array" do
  		expect(@blog.add_post(@post)).to contain_exactly(@post)
  	end
  end

  describe "#latest_posts" do

  	it "Returns an array of the posts in the correct chronological order." do
  		@blog.add_post(@post)
  		@blog.add_post(@post2)
  		blog_ordered = @blog.latest_posts
  		expect(blog_ordered[0]).to eq(@post2)
  	end
  end
  
end
