#!/usr/bin/env ruby
require 'csv'
require 'json'

# This application takes a csv file and converts it into a json object with 3 hashes required by influxdb


#Takes 3 arguments: Name of database, name of .csv file, name of .json file
name = ARGV[0].to_s

#Open .csv file
#lines = CSV.open(ARGV[1]).readlines
lines = CSV.open(ARGV[1]).readlines
columns = lines.delete lines.first.to_a


#Take .csv headers, convert to array, convert to hash
points = Array.new
lines.each do |row|
    points.push(row.to_a)
end

influx_json = Hash[{ "name" => name, "columns" => columns, "points" => points }]

#Save to file
File.open(ARGV[2], 'w') do |f|
    f.puts influx_json.to_json
end

# puts JSON.pretty_generate(influx_json.to_json)