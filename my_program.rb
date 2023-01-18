p "Where are you located?"
#user_location = gets.chomp
user_location = "Chicago"
p user_location

gmats_key = ENV.fetch("GMAPS_KEY")
dark_sky_key = ENV.fetch("DARK_SKY_KEY")


gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + gmats_key



require("open-uri") #in order for open to apply for internet
require "json"
raw_data = URI.open(gmaps_url).read
parsed_data = JSON.parse(raw_data)
parsed_data.keys
results_array = parsed_data.fetch("results").at(0)
geo_hash = results_array.fetch("geometry")
loc_hash = geo_hash.fetch("location")
latitude = loc_hash.fetch("lat")
longitude = loc_hash.fetch("lng")

darksky_url = "https://api.darksky.net/forecast/"+ dark_sky_key +"/"+ latitude.to_s + "," + longitude.to_s

ds_raw_data = URI.open(darksky_url).read
ds_parsed_data =JSON.parse(ds_raw_data)
ds_currently_hash = ds_parsed_data.fetch("currently")
ds_minutely_hash = ds_parsed_data.fetch("minutely")
ds_data_hash = ds_minutely_hash.fetch("data")
time_current = 
p ds_temperature = ds_currently_hash.fetch("temperature")
p ds_summary = ds_minutely_hash.fetch("summary")

p Time.at(ds_data_hash.at(0).fetch("time"))
