require 'sinatra'
require 'yahoo_weatherman'

def weather(location)
client = Weatherman::Client.new
response = client.lookup_by_location(location)
end

get '/' do
erb :home
end

post '/weather' do
location = params[:post]['location']
@condition = weather(location).condition['text']
@degree = (weather(location).condition['temp'])*1.8+32
if (@condition.downcase == 'sunny' || @condition.downcase == 'clear')
erb :sunny
elsif (@condition.downcase == 'cloudy' || @condition.downcase == 'mostly cloudy')
erb :cloudy
elsif (@condition.downcase == 'snowy')
erb :snowy
elsif (@condition.downcase == 'rainy' || @condition.downcase == 'light rain')
erb :rainy
else
erb :weather
end
end
