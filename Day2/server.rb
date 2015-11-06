require "pry"
require "sinatra"
require "sinatra/reloader" if development?
enable(:sessions)

get "/" do
	"My first Sinatra app."
end

get "/about" do
	"Hi, my name is Iago. I'm an Ironhack"
end

get "/about2" do
	"Hi, my new name is IagoMoure. I'm an Ironhack Development"
end
	
get "/author" do
	@gretting = "Hello World"
	erb(:author)
end

get "/pizza" do
	@ingredients = ["cheese","ham","tomato"]
	erb(:pizza)
end

get "/session_test/:test" do
	text = params[:test]
	session[:saved_value] = text
	redirect to("/session_show")
end

get "/session_show" do
	"Now in the session " + session[:saved_value]
end

get "/users/:username" do
	@username = params[:username]
	erb(:user_profile)
end

get "/hours/ago/:hoursago" do
	@hoursago = params[:hoursago]
	@ahora = Time.now.strftime("%H:%M")
	@requestedhour = (Time.now - @hoursago.to_i*3600).strftime("%H:%M")

	erb(:show_hours_ago)
end