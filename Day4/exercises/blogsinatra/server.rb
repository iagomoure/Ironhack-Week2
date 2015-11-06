require 'sinatra'

require_relative './lib/blog.rb'
require_relative './lib/post.rb'



blog = Blog.new
blog.add_post(Post.new("Post1","My first post"))
blog.add_post(Post.new("Post2","My second post"))
blog.add_post(Post.new("Post3","My third post"))
blog.add_post(Post.new("Post4","My forth post"))

get "/" do
	redirect("/posts_index")
end

get "/posts_index" do
	@posts = blog.posts
	erb(:posts_index)
end

get "/posts_chrono" do
	@posts_ordered = blog.latest_posts
	erb(:posts_chrono)
end

get "/post_details/:index" do
	@post = blog.posts[params[:index].to_i]
	erb(:post_details)
end

get "/post_chrono_details/:index" do
	@post = blog.latest_posts[params[:index].to_i]
	erb(:post_chorno_details)
end