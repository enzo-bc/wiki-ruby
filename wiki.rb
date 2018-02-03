require 'sinatra'

$myinfo = "Aleksandra Chybowska"
@info = ""

def readFile(filename)
	info = ""
	file = File.open(filename)
	
	file.each do |line|
		info = info + line
	end

	file.close
	return info
end

get '/' do
	info = "Hello there!"
	len = info.length 
	len1 = len
	$myinfo = readFile("wiki.txt")
	@info = info + " " + $myinfo 
	len = @info.length 
	len2 = len - 1 
	len3 = len2 - len1
	@words = len3.to_s

	erb :home
end

get '/about' do
	erb :about
end

get '/create' do
	erb :create
end

get '/login' do
	erb :login
end

get '/edit' do 
	@info = readFile("wiki.txt")
	erb :edit
end

put '/edit' do
	info = "#{params[:message]}"
	@info = info
	file = File.open("wiki.txt", "w")
	file.puts @info
	file.close
	redirect '/'
end

not_found do 
	status 404
	redirect '/'
end
