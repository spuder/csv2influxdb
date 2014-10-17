#!/usr/bin/env ruby
require "slop"

opts = Slop.parse(:banner => 'herp derp', :help => true ) do

  on 'd', 'database=', 'Influxdb database name (Required)',     :argument => true
  on 'i', 'in', 'CSV filename to read in (Required)',           :argument => true
  on 'o', 'out', 'JSON filename to output to ',                 :argument => true
  on 'p', 'pretty', 'Output pretty formatted json',             :argument => false
  on 'v', 'version', 'Shows version',                           :argument => false
end

unless opts.database?
    puts 'You must specify a database name (-d)'
    puts opts
end

puts opts["database"]
# begin
#   opts.parse
# rescue Slop::Error => e
#   puts e.message
#   puts opts # print help
# end