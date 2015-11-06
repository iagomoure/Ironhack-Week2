require_relative '../server.rb'

RSpec.describe "Post" do 

  before :each do
    @post = Post.new("Post1","Hi, this is my first post")
  end

  describe "#initialize" do

    it "Create a new post correctley. For example check title" do
      expect(@post.title).to eq ("Post1")
    end
  end
end