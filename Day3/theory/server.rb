require "sinatra"
require "sinatra/reloader" if development?

enable(:sessions)

get '/' do
  redirect('/profile') if session[:username]
  erb(:index)
end

get '/logout' do
  session[:username] = nil
  redirect('/')
end

post '/login' do
  users = {"iago" => "1234", "moure" => "5678"}
  is_valid = users[params[:username]] == params[:password]
  session[:username] = params[:username] if is_valid
  redirect('/profile')
end

get '/profile' do
  @username = session[:username]
  erb(:profile)
end