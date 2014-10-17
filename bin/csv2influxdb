#!/usr/bin/env ruby
require 'csv'
require 'json'
require "slop"

opts = Slop.parse(:banner => 'csv2influxdb', :help => true ) do
    on 'd', 'database=', 'Influxdb database name (Required)',     :argument => true
    on 'i', 'in', 'CSV filename to read in',                      :argument => true
    on 'o', 'out=', 'JSON filename to output to ',                :argument => true
    on 'p', 'pretty', 'Output pretty formatted json',             :argument => false
    on 'v', 'version', 'Shows version',                           :argument => false
end

unless opts.database?
    puts 'You must specify a database name (-d)'
    puts opts
    exit
end


#Takes 3 arguments: Name of database, name of .csv file, name of .json file
name = opts["database"]

if opts.in?
    @csv_lines = CSV.open(opts[:in]).readlines #Save CSV file to array
    columns = @csv_lines.delete @csv_lines.first.to_a #Save CSV headers, then delete from CSV object
else
    @csv_lines = Array.new
    ARGF.each_line do |line|
        line_gsubed = line.gsub /"/, '' #Remove extra quotes from the string
        line_chomped = line_gsubed.chomp #Remove \n from string
        split_lines = line_chomped.split(",") #Split at commas and then put into an array
        @csv_lines.push(split_lines) #Create a multidementional array of arrays
    end
    columns = @csv_lines.shift #Delete first element of array (we only want the data, not the csv headers)
end


@points = Array.new
@csv_lines.each do |row|
    @points.push(row) #Each row is an array, create an array of arrays
end

#Convert arrays into hashes
influx_json = Hash[{ "name" => name, "columns" => columns, "points" => @points }]

#Save to file
if opts.out?
    File.open(opts[:out], 'w') do |f|
        if opts.pretty?
            f.puts JSON.pretty_generate(influx_json)
        else
            f.puts influx_json.to_json
        end
    end
else
    if opts.pretty?
        puts JSON.pretty_generate(influx_json)
    else
        puts influx_json.to_json
    end
end

# puts JSON.pretty_generate(influx_json.to_json)