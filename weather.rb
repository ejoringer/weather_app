require 'yahoo_weatherman'

puts "Please type your zip code:"
zipcode = gets

def location (zipcode)
  client = Weatherman::Client.new
  client.lookup_by_location(zipcode)
end

weather = location(zipcode)

today = Time.now.strftime('%w').to_i

weather.forecasts.each do |forcast|  

  day = forcast['date']
  weekday =  day.strftime('%w').to_i
  
  if (weekday == today)
    daysName = 'Today'
  elsif (weekday == today + 1)
    daysName = "Tomorrow"
  else  
    daysName = day.strftime('%A')
  end  
  
  puts daysName + ' will see ' + forcast['text'].downcase + 
  ' with a low of ' + forcast['low'].to_s + ' and a high of ' + 
  forcast['high'].to_s + ' degrees celsius.'    
end







