require 'sinatra'
require 'yahoo_weatherman'

def weather(location)
client = Weatherman::Client.new
response = client.lookup_by_location(location)
#temp = "It is " +(((response.condition['temp'])*1.8+32).to_s)+" degrees Fahrenheit!"
condition = response.condition['text'].to_s
end

get '/' do
erb :home
end

post '/weather' do
location = params[:post]['location']
@condition = weather(location)
if (@location == 'sunny')
erb :sunny
elsif (@location == 'clear')
erb :sunny
elsif (@location == 'cloudy')
erb :cloudy
elsif (@location == 'mostly cloudy')
erb :cloudy
elsif (@location == 'snowy')
erb :snowy
elsif (@location == 'rainy')
erb :rainy
elsif (@location -- 'light rain')
erb :rainy
else
erb :weather
end
end
