require 'sinatra'
require 'yahoo_weatherman'

#puts "What is the zip code you wish to search for?"
zipcode = '72703'

def weather(zipcode)
client = Weatherman::Client.new
response = client.lookup_by_location(zipcode)
temp = ((response.condition['temp'])*1.8+32).to_s
condition = response.condition['text'].to_s
puts temp
puts condition
end


#puts "It is "+(((response.condition['temp'])*1.8+32).to_s) +" degrees Fahrenheit!"
#puts "The conditions are "+(response.condition['text'].to_s)+"."

get '/' do
erb :home
end

post '/weather' do
post = params[:post]
post = {zipcode: gets, temp: temp, condition: condition}

erb :home
end